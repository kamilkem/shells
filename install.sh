#!/usr/bin/env bash

base=`pwd`
options=("macos-homebrew" "Quit")

### Load file with colors
source $base/.colors.sh

__print_line() {
    message="${1}"
    echo -e "${message}"
}

__print_line_add() {
    message="${1}"
    echo -e "${__COLOR_GREEN}[+] ${__COLOR_RESET}${message}"
}

__print_line_remove() {
    message="${1}"
    echo -e "${__COLOR_RED}[-] ${__COLOR_RESET}${message}"
}

__print_line_info() {
    message="${1}"
    echo -e "${__COLOR_MAGENTA}[info] ${__COLOR_RESET}${message}"
}

__link_file() {
    file1=${1}
    file2=${2}
    if [ -f "$file2" ] ; then
        __print_line_remove "Remove file: ${file2}"
        rm "$file2"
    fi
    __print_line_add "Link file: $file1 => $file2"
    ln -s $file1 $file2
}

__install_macos_homebrew() {
    path="$base/macos-homebrew"
    __print_line_info "Installing macos-homebrew\n"
    __link_file $path/.bash_profile ~/.bash_profile
    __link_file $path/.bashrc ~/.bashrc
}

__menu_choice() {
    PS3='Please enter your choice: '
    select opt in "${options[@]}"
    do
        case $opt in
            "macos-homebrew")
                __install_macos_homebrew
                break
                ;;
            "Quit")
                break
                ;;
            *) __print_line "invalid option $REPLY";;
        esac
    done
}

__menu_choice
