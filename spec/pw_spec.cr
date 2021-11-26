require "./spec_helper"

private MASTER_PASSWORD = "Strong password"
private DOMAIN = "Some domain"
private USERNAME = "Some username"

private ENV = { "MASTER_PASSWORD" => MASTER_PASSWORD }

describe "pw" do
  context "without master password" do
    run_binary(success: false, error: "MASTER_PASSWORD must be set\n")
  end

  context "with master password from env" do
    run_binary(env: ENV, args: [DOMAIN, USERNAME], output: "W1OUFAiG71yeBLmj2XkcdcxUPk7K0jzsgjOX3GiAQXvGLvC1pI8Bl8+6ufdlubpjpfQBqvtAXpLHoEa60u/Fyw==\n")
  end

  context "with master password from stdin" do
    run_binary(input: "#{MASTER_PASSWORD}\n", args: ["-", DOMAIN, USERNAME], output: "W1OUFAiG71yeBLmj2XkcdcxUPk7K0jzsgjOX3GiAQXvGLvC1pI8Bl8+6ufdlubpjpfQBqvtAXpLHoEa60u/Fyw==\n")
  end

  describe "--init" do
    run_binary(env: ENV, args: ["--init"]) do |status, output, error|
      output.should match /^.{88}\n$/
    end
  end

  describe "--length" do
    run_binary(env: ENV, args: ["--length=8", DOMAIN, USERNAME], output: "W1OUFAiG\n")
  end

  describe "--alphanumeric-only" do
    run_binary(env: ENV, args: ["--alphanumeric-only", DOMAIN, USERNAME], output: "W1OUFAiG71yeBLmj2XkcdcxUPk7K0jzsgjOX3GiAQXvGLvC1pI8Bl86ufdlubpjpfQBqvtAXpLHoEa60uFyw\n")
  end

  describe "--show" do
    run_binary(env: ENV, args: ["--show", DOMAIN, USERNAME], output: "Strong password,Some domain,Some username\n")
  end

  describe "--copy" do
    run_binary(env: ENV, args: ["--copy", DOMAIN, USERNAME], output: "\e]52;c;VzFPVUZBaUc3MXllQkxtajJYa2NkY3hVUGs3SzBqenNnak9YM0dpQVFYdkdM\ndkMxcEk4Qmw4KzZ1ZmRsdWJwanBmUUJxdnRBWHBMSG9FYTYwdS9GeXc9PQ==\n\a\n")
  end
end
