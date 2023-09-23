_pw() {
  local IFS='
'
  local OPTION_WORDLIST=(
    "-i "
    "--init "
    "-l "
    "--length="
    "-a "
    "--alphanumeric-only "
    "-s "
    "--show "
    "-c "
    "--copy "
    "- "
    "-r "
    "--rescue "
    "-h "
    "--help "
    "-V "
    "--version "
  )
  COMPREPLY=(
    $(
      case "$3,$2" in
        *,-*)
          compgen -W "${OPTION_WORDLIST[*]}" -- "$2"
          ;;
      esac
    )
  )
}

complete -o bashdefault -o default -o nospace -F _pw pw
