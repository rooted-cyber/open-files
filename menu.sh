start() {
	bash ~/open-files/open.sh
	}
	start2 () {
		bash ~/open-files/share.sh
		}
		speed () {
			speedtest
			}
			men() {
	printf "\n\033[1;91m Invalid input !!!\n\n"
	menu
	}
	menu() {
	echo -e -n "\033[1;93mOpen\033[1;97m@\033[1;93mfiles\033[1;97m -->> "
	read b
	case $b in
	1)start ;;
	2)start2 ;;
	3)speed ;;
	4)exit ;;
	*)men ;;
	esac
	}
	menu