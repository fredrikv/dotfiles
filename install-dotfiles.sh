#!/bin/bash

function linkit {
    source=$1
    target=$2

    if [ -e "$target" ];
    then
        if [ "$(readlink $target)" != "$(readlink -f $source)" ]; then
            echo "[ FAIL ] The file already exists: $target"
        fi
    else
        ln -s "$source" "$target"
        if [ "$?" != "0" ]; then
            echo "[ FAIL ] $target"
        fi
    fi
}

for dotfile in *.dotfile **/*.dotfile
do
    source="$(pwd)/$dotfile"
    target=~/".${dotfile%\.dotfile}"

    linkit "$source" "$target"
done
