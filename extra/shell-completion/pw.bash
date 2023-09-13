_pw() {
  local IFS='
'
  local WORDLIST=(
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
          compgen -W "${WORDLIST[*]}" -- "$2"
          ;;
      esac
    )
  )
}

complete -o bashdefault -o default -o nospace -F _pw pw
