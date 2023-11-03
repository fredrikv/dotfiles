#!/bin/bash

mkdir -p build
cd build


# Install neovim
sudo apt-get install ninja-build gettext cmake unzip curl

if [ ! -f neovim ]; then
    git clone https://github.com/neovim/neovim
fi

cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb


