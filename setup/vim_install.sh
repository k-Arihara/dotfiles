#!/bin/bash

read -p "download directory: " DOWNLOAD_DIR

if [ -z "${DOWNLOAD_DIR}" ]; then
  echo "You need to enter the path to the correct directory."
  exit 1
fi

if [ ! -d ${DOWNLOAD_DIR} ]; then
  echo "Specified directory does not exist."
  exit 1
fi

read -sp "Password: " password

echo "${password}" | sudo -S apt remove --purge vim vim-runtime vim-common

echo "${password}" | sudo -S rm -rf /usr/local/share/vim
echo "${password}" | sudo -S rm -f /usr/local/bin/vim

echo "${password}" | sudo -S apt -y update
echo "${password}" | sudo -S apt -y upgrade

echo "${password}" | sudo -S apt install -y build-essential ncurses-dev lua5.2 lua5.2-dev luajit python-dev python3-dev ruby-dev

cd ${DOWNLOAD_DIR}

if [ -d ${DOWNLOAD_DIR}/vim ]; then
  echo "${password}" | sudo -S git pull
else
  echo "${password}" | sudo -S git clone --depth 1 https://github.com/vim/vim
fi

cd vim

cd src
echo "{password}" | sudo -S make distclean
cd ..

echo "${password}" | sudo -S ./configure --with-features=huge --enable-multibyte --enable-luainterp=dynamic --enable-gpm --enable-cscope --enable-fontset --enable-fail-if-missing --prefix=/usr/local --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-rubyinterp=dynamic

echo "${password}" | sudo -S make
echo "${password}" | sudo -S make install
