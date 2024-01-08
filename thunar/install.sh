#!/bin/bash
_info(){
    echo "Thunar"
}

_check(){
    which thunar &>/dev/null && exit 0 || exit 1
}

_install(){
    sudo -u $(logname) echo "$(cat <(head -n -1 < /home/$(logname)/.config/Thunar/uca.xml) "$(dirname $0)/hide-unhide.xml" <(echo "</actions>"))" >/home/$(logname)/.config/Thunar/uca.xml && exit 0 || exit 1
}

[[ "$1" == info ]] && _info
[[ "$1" == check ]] && _check
[[ "$1" == install ]] && _install
