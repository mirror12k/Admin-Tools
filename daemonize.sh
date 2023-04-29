#!/bin/sh

echo "[+] adding user '$1'"
sudo useradd "$1" && {
	echo "[+] user created, initializing home folder"
	sudo mkdir "/home/$1"
	sudo chown $1:$1 "/home/$1"

	echo "[+] initializing log"
	touch "$3"
	sudo chown $1:$1 "$3"
} || echo "[-] user already exists"

echo "[+] starting daemon"
sudo su "$1" -c "nohup ./keepalive.sh \"$2\" < \"$4\" >> \"$3\" 2>&1 &"
