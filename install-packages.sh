#!/bin/bash

function installit {
    install_script=$1
    package=${1#packages/}
    build_path="build/$package"

    mkdir -p build

    if [ -e "$build_path" ];
    then
        echo -n "[ INFO ] Updating $package... "

        if [ "$(git -C "$build_path" pull)" == "Already up to date." ]; then
            echo "Already up to date."
	    return
        fi
    else
        echo -n "[ INFO ] Installing $package... "
    fi

    output=$(bash -c "cd build && source \"../${install_script}\" 2>&1")
    if [ 0 = "$output" ]; then
	echo "DONE"
    else
	echo "FAILED"
	if [ "" != "$output" ]; then
	    echo "$output"
	fi
    fi
}

if [[ $# -eq 0 ]]; then
    for install_script in packages/*
    do
	installit "${install_script}"
    done
else
    for package in "$@"; do
	installit "packages/$package"
    done
fi

