set () {
	termux-setup-storage
	printf "\n\033[1;92m Installing requirements\n"
	apt update
	apt upgeade
	apt install wget
	apt install apache2
	apt install openssh
	apt install php
	apt install curl
	mkdir /sdcard/open-files
	mkdir /sdcard/open-share
	cd ~/open-files
	pip install -r requirements.txt
	cp -f ~/ngrok ~/open-files
	ngrok-download
	printf "All installed\n"
	cd $PREFIX/bin
	echo "#!/data/data/com.termux/files/usr/bin/sh" >> open
	echo "python ~/open-files/open.py" >> open
	chmod 700 open
	printf "\nNow you can use this command : open\n"
	read
	}
	ngrok-download() {
		cd ~/open-files
		if [ -e ngrok ];then
		chmod 777 ngrok
		else
		printf "\n\033[1;92m Downloading ngrok\n"
		wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip
		unzip ngrok*
		chmod 700 ngrok
		fi
		}