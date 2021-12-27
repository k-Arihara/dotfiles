#!/bin/bash
read -sp "Password: " password

echo "${password}" | sudo -S apt update
echo "${password}" | sudo -S apt upgrade

# pipをインストールするためのスクリプトをダウンロード
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

echo "${password}" | sudo -S python get-pip.py
echo "${password}" | sudo -S python3 get-pip.py

rm -f get-pip.py

# neovimのpython clientをインストール
echo "${password}" | sudo -S pip install pynvim

# neovimをインストール
echo "${password}" | sudo -S apt install neovim

