#!/bin/bash
_install(){
    sudo cp "$(dirname $0)/lsh" /usr/bin && exit 0 || exit 1
}
[[ "$1" == install ]] && _install

