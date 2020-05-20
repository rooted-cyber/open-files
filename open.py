import os
os.system("bash ~/open-files/setup.sh")
def c():
	os.system("clear")


def start():
	os.system("bash ~/open-files/open.sh")
	
def start2():
	os.system("bash ~/open-files/open.sh")


def menu():
	c()
	os.system("figlet Open-files|lolcat")
	os.system('printf "\n\n	\033[1;93m[::]\033[1;97m This tool is created by Maruf\033[1;93m [::]\n\n"')
	print("\033[1;93m[\033[97m1\033[1;93m]\033[1;96m Open Html File \n")
	print("\033[1;93m[\033[97m2\033[1;93m]\033[1;96m Share your file\n")
	print("\033[1;93m[\033[97m3\033[1;93m]\033[1;96m Check your internet speed\n")
	print("\033[1;93m[\033[97m4\033[1;93m]\033[1;96m Exit\n\n")
	os.system("bash menu.sh")


menu()