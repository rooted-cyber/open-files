trap 'printf "\n";stop' 2
folder () {
	cd $PREFIX/share/apache*/def*/htd*
	}
stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
killall -2 ssh > /dev/null 2>&1
fi
exit 1

}


file () {
	printf "\n\033[1;92m Copy .html file in \033[1;97m /sdcard/open-files\n"
	read
	cd /sdcard/open-files
	if [ -e *.html ];then
	cd $PREFIX/share/apach*/def*/htdo*
	rm -f * > /dev/null 2>&1
	rm -rf manual > /dev/null 2>&1
	cd /sdcard/open-files
	cp -f *.html $PREFIX/share/apach*/def*/htdo*
	cp -f *.html ~/open-files
	apachectl start > /dev/null 2>&1
	subdomain
	else
	printf "\n\033[1;91m File not foumd\n"
	exit
	fi
	}
	serveo-start () {
		cd $PREFIX/share/apache*/def*/htd*
		printf "\n\033[1;93m[\033[1;77m*\033[1;93m]\033[1;92m Starting serveo server.....\n"
		$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:3333 serveo.net 2> /dev/null > sendlink ' &
		sleep 9
		printf "\n\033[1;93m[\033[1;77m*\033[1;93m]\033[1;92m Starting php server.....\n"
		fuser -k 3333/tcp > /dev/null 2>&1
		php -S localhost:3333 > /dev/null 2>&1 &
		sleep 3
		send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
		printf '\n\n\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] '
		sleep 0.5
		printf "\033[1;93mYour "
		sleep 0.5
		printf "\033[1;97mServeo "
		sleep 0.5
		printf '\033[1;93mlink:\e[0m\e[1;77m %s\n\n' $send_link
		printf "\n\033[1;93m[\033[0m*\033[1;93m]\033[1;92m Starting Ngrok server....\n"
		folder
php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
cd ~/open-files
chmod 777 ngrok
./ngrok http 3333 > /dev/null 2>&1 &
folder
sleep 12
sleep 1
link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "\n\033[1;93m[√] "
sleep 0.2
printf "\033[1;92mY"
sleep 0.2
printf "o"
sleep 0.2
printf "u"
sleep 0.2
printf "r"
sleep 0.2
printf " "
sleep 0.2
printf "\033[1;97mNgrok "
sleep 0.1
printf "\033[1;92ml"
sleep 0.1
printf "i"
sleep 0.1
printf "n"
sleep 0.1
printf "k"
sleep 0.1
printf ":- \033[0m%s\n" $link
		
		}
	start-subdomain () {
		echo -e -n "\n\033[1;93m[\033[0m*\033[1;93m] \033[1;92mSubdomain : \033[0m"
		read ab
		if [ ! -z $ab ];then
		cd $PREFIX/share/apache*/def*/htd*
		printf "\n\033[1;93m[\033[1;77m*\033[1;93m]\033[1;92m Starting serveo server.....\n"
		$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R '$ab':80:localhost:3333 serveo.net  2> /dev/null > sendlink ' &
		sleep 9
		fi
		printf "\n\033[1;93m[\033[1;77m*\033[1;93m]\033[1;92m Starting php server.....\n"
		fuser -k 3333/tcp > /dev/null 2>&1
		php -S localhost:3333 > /dev/null 2>&1 &
		sleep 3
		send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
		printf '\n\n\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] '
		printf "\033[1;93mYour "
		sleep 0.5
		printf "\033[1;97mServeo "
		sleep 0.5
		printf '\033[1;93mlink:\e[0m\e[1;77m %s\n\n' $send_link
		printf "\n\033[1;93m[\033[0m*\033[1;93m]\033[1;92m Starting Ngrok server....\n"
		folder
php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
cd ~/open-files
chmod 777 ngrok
./ngrok http 3333 > /dev/null 2>&1 &
folder
sleep 12
sleep 1
link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
#printf "\e[1;92m[\e[0m*\e[1;92m] Your ngrok link:\e[0m\e[1;77m %s\e[0m\n" $link
printf "\n\033[1;93m[√] "
sleep 0.2
printf "\033[1;92mY"
sleep 0.2
printf "o"
sleep 0.2
printf "u"
sleep 0.2
printf "r"
sleep 0.2
printf " "
sleep 0.2
printf "\033[1;97mNgrok "
sleep 0.1
printf "\033[1;92ml"
sleep 0.1
printf "i"
sleep 0.1
printf "n"
sleep 0.1
printf "k"
sleep 0.1
printf ":- \033[0m%s\n" $link
		}
	subdomain () {
		echo -e -n "\n\033[1;93m[\033[1;77m*\033[1;93m]\033[1;92m Custome subdomain \033[1;91m(\033[0my|N\033[1;91m) \033[97m"
		read a
		case $a in
		y|Y)start-subdomain ;;
		n|N)serveo-start ;;
		*)subdomain
		esac
		}
		file