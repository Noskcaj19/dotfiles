#!/usr/bin/env zsh
check_up_tree_directory_name() {
    if [[ $1 = n ]]; then
        typeset -A _mynamedpaths

        local parts=(${(@s:/:)PWD})
        local i=1
        for part in $parts
        do
            _mynamedpaths[$part]=/${(pj:/:)parts[1,i]}
            (( i++ ))
        done

        if [[ -n $_mynamedpaths[$2] ]]; then
            reply=($_mynamedpaths[$2])
            return 0
        else
            return 1
        fi
    fi
}

zsh_directory_name_functions+=(check_up_tree_directory_name)