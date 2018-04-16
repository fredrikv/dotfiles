#!/bin/bash

for DOTFILE in *.dotfile
do
    SOURCE="$(pwd)/$DOTFILE"
    TARGET="~/.${DOTFILE%\.dotfile}"

    if [ -e "$TARGET" ];
    then
            if [ "$(readlink $TARGET)" != "$(readlink -f $SOURCE)" ]; then
                echo "[ FAIL ] The file already exists: $TARGET"
            fi
    else
        ln -s "$SOURCE" "$TARGET"
        if [ "$?" != "0" ]; then
            echo "[ FAIL ] $TARGET"
        fi
    fi
done
