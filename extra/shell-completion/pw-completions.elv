set edit:completion:arg-completer["pw"] = { |command @args|
  edit:complete-getopt $args [
    [
      &short="i"
      &long="init"
      &desc="Generate a secure, random password"
    ]
    [
      &short="l"
      &long="length"
      &desc="Specifies the password length"
      &arg-required
    ]
    [
      &short="a"
      &long="alphanumeric-only"
      &desc="Remove non-alphanumeric characters"
    ]
    [
      &short="s"
      &long="show"
      &desc="Show password"
    ]
    [
      &short="c"
      &long="copy"
      &desc="Copy password"
    ]
    [
      &short="r"
      &long="rescue"
      &desc="Rescue mode"
    ]
    [
      &short="h"
      &long="help"
      &desc="Show this help"
    ]
    [
      &short="V"
      &long="version"
      &desc="Show version"
    ]
  ] [
  ]
}
