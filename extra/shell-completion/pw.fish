complete -c pw -f
complete -c pw -s i -l init -d "Generate a secure, random password"
complete -c pw -s l -l length -x -d "Specifies the password length"
complete -c pw -s a -l alphanumeric-only -d "Remove non-alphanumeric characters"
complete -c pw -s s -l show -d "Show password"
complete -c pw -s c -l copy -d "Copy password"
complete -c pw -s r -l rescue -d "Rescue mode"
complete -c pw -s h -l help -d "Show this help"
complete -c pw -s V -l version -d "Show version"
