#!/bin/bash
_info(){
    echo "Nemo"
}

_check(){
    which nemo &>/dev/null && exit 0 || exit 1
}

_install(){
    [[ "$2" == "g" ]] && {
        cp "$(dirname $0)/hide-unhide.nemo_action" "/usr/share/nemo/actions/" && exit 0 || exit 1
    } || {
        sudo -u $(logname) cp "$(dirname $0)/hide-unhide.nemo_action" "/home/$(logname)/.local/share/nemo/actions/" && exit 0 || exit 1
    }
}

[[ "$1" == info ]] && _info
[[ "$1" == check ]] && _check
[[ "$1" == install ]] && _install "$@"
