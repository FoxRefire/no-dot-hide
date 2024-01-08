#!/bin/bash
_info(){
    echo "KDE's file manager"
}

_check(){
    which dolphin &>/dev/null ||
    which krusader &>/dev/null ||
    which konqueror &>/dev/null && exit 0 || exit 1
}

_install(){
    cp "$(dirname $0)/hide-unhide.desktop" "/usr/share/kio/servicemenus" && exit 0 || exit 1
}

[[ "$1" == info ]] && _info
[[ "$1" == check ]] && _check
[[ "$1" == install ]] && _install
