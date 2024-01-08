#!/bin/bash
_info(){
    echo "PCManFM-qt"
}

_check(){
    which pcmanfm-qt &>/dev/null && exit 0 || exit 1
}

_install(){
    sudo -u $(logname) cp "$(dirname $0)/hide-unhide.desktop" "/home/$(logname)/.local/share/file-manager/actions" && exit 0 || exit 1
}

[[ "$1" == info ]] && _info
[[ "$1" == check ]] && _check
[[ "$1" == install ]] && _install
