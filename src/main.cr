require "openssl"
require "option_parser"

require "./io/console"

macro version
  {{ `git describe --tags --always`.chomp.stringify }}
end

class Digest::SHA3_512 < OpenSSL::Digest
  extend ClassMethods
  def initialize
    super("sha3-512")
  end
end

length = nil
alphanumeric_only = false
show_password = false
copy_password = false
master_password = ENV["MASTER_PASSWORD"]?

OptionParser.parse do |parser|
  parser.banner = "Usage: pw [switches] [--] [arguments]"
  parser.on("-i", "--init", "Generate a secure, random password") do
    master_password = Random::Secure.base64
  end
  parser.on("-l LENGTH", "--length=LENGTH", "Specifies the password length") { |value| length = value.to_i }
  parser.on("-a", "--alphanumeric-only", "Remove non-alphanumeric characters") { alphanumeric_only = true }
  parser.on("-s", "--show", "Show password") { show_password = true }
  parser.on("-c", "--copy", "Copy password") { copy_password = true }
  parser.on("-", "Read master password from stdin") do
    master_password = STDIN.gets_to_end.chomp
  end
  parser.on("-r", "--rescue", "Rescue mode") do
    puts <<-'EOF'
      Used random methods to date:
      openssl rand -base64 16

      Used deterministic methods to date:
      printf 'Strong password,Some domain,Some username' | openssl dgst -binary -sha3-512 | openssl enc -A -base64

      See `openssl help` for `dgst` and `enc` options.
      EOF
    exit
  end
  parser.on("-h", "--help", "Show this help") do
    puts parser
    exit
  end
  parser.on("-v", "--version", "Show version") do
    puts version
    exit
  end
  parser.missing_option do |flag|
    abort "ERROR: #{flag} is missing something."
  end
  parser.invalid_option do |flag|
    abort "ERROR: #{flag} is not a valid option."
  end
end

# Prompt for master password (only if stdin is a tty).
if !master_password && STDIN.tty?
  STDERR.print "master password: "
  master_password = STDIN.noecho { gets(chomp: true) }
  exit(1) unless master_password.presence
  sha = Digest::SHA3_512.base64digest(master_password.to_s)
  STDERR.puts "%.2s••••••" % sha
end

abort "MASTER_PASSWORD must be set" unless master_password

password = [master_password].concat(ARGV).join(",")

if !show_password
  password = Digest::SHA3_512.base64digest(password)
  password = password.delete("+/=") if alphanumeric_only
  password = password[...length]
end

password = "\e]52;c;%s\a" % Base64.encode(password) if copy_password

puts password
