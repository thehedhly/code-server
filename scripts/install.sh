#!/bin/bash

set -e

main() {
    if [ -z "${1}" ]
    then
        exit
    else
        case $1 in
            *hadolint* )
                install_hadolint
                ;;
            *yamllint* )
                install_yamllint
                ;;
        esac
    fi
}

install_hadolint(){
    > install_hadlint.txt
}

install_yamllint(){
    > install_yamllint.txt
}

touch /dummy.txt
main "$@"

touch hello.txt
