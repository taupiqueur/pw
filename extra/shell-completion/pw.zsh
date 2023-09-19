#compdef pw

local OPTION_WORDLIST=(
  "-i[Generate a secure, random password]"
  "--init[Generate a secure, random password]"
  "-l[Specifies the password length]:length:"
  "--length=[Specifies the password length]:length:"
  "-a[Remove non-alphanumeric characters]"
  "--alphanumeric-only[Remove non-alphanumeric characters]"
  "-s[Show password]"
  "--show[Show password]"
  "-c[Copy password]"
  "--copy[Copy password]"
  "-[Read master password from stdin]"
  "-r[Rescue mode]"
  "--rescue[Rescue mode]"
  "-h[Show this help]"
  "--help[Show this help]"
  "-V[Show version]"
  "--version[Show version]"
)

_arguments -S -s "${OPTION_WORDLIST[@]}"
