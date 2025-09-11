# A deterministic password generator.
extern "pw" [
  --init(-i) # Generate a secure, random password
  --length(-l): int # Specifies the password length
  --alphanumeric-only(-a) # Remove non-alphanumeric characters
  --show(-s) # Show password
  --copy(-c) # Copy password
  --rescue(-r) # Rescue mode
  --help(-h) # Show this help
  --version(-V) # Show version
]
