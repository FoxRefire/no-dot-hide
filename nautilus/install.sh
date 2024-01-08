#!/bin/bash
_info(){
    echo "Nautilus"
}

_check(){
    which nautilus &>/dev/null && exit 0 || exit 1
}

_install(){
    sudo -u $(logname) cp "$(dirname $0)/Hide∕Unhide" "/home/$(logname)/.local/share/nautilus/scripts" &&
    chmod +x "/home/$(logname)/.local/share/nautilus/scripts/Hide∕Unhide" && exit 0 || exit 1
}

[[ "$1" == info ]] && _info
[[ "$1" == check ]] && _check
[[ "$1" == install ]] && _install
