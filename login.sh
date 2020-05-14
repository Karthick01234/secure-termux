#!/bin/bash
# secure-termux
# coded by: github.com/karthick01234/secure-termux
# If you use any part from this code, giving me the credits. Read the Lincense!

my() {


printf "\e[1;92m  ____             \e[0m\e[1;77m     _ _ _ _ _  \e[0m\n"
printf "\e[1;92m / ___|    _ _ _ _  \e[0m\e[1;77m   |_ _   _ _|  \e[0m\n"
printf "\e[1;92m \___ \   |_ _ _ _|  \e[0m\e[1;77m      | |       \e[0m\n"
printf "\e[1;92m  ___) |   _ _ _ _    \e[0m\e[1;77m     | |        \e[0m\n"
printf "\e[1;92m |____/   |_ _ _ _|    \e[0m\e[1;77m    |_|         \e[0m\n"
printf "\e[1;92m                        \e[0m                        \n"

printf "\n"

printf " \e[1;77m v1.1 coded by github.com/karthick01234/secure-termux[0m \n"

printf "\n"

start
}

start() {
   printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Did you have Termux-api installed in your mobile phone ? \e[0m\n"
   printf "\n"
   printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m if you don't have Termux-api install it from google play store...\e[0m\n"
   printf "\n"
   read -p "Did you have termux-api type yes/no : " option_server
   printf "\n"

   if [[ $option_server == "yes" || $option_server == "YES" || $option_server == "Yes" || $option_server == "Y" || $option_server == "Y" ]]; then
   
   ben
   
   elif [[ $option_server == "no" || $option_server == "NO" || $option_server == "No" || $option_server == "N" || $option_server == "n" ]]; then
   
   printf "\n"
   printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Install termux-api from google play store ...\e[0m\n"
   
   else
   
   printf "\n"
   printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Invalid option ...\e[0m\n"
   exit 1
   fi
}
ben() {
   if [[ -e ../../usr/bin/secure-termux/pass.txt ]]; then
   rm -rf ../../usr/bin/secure-termux/pass.txt > /dev/null 2>&1 &
   rm -rf ../../usr/bin/secure-termux/user.txt > /dev/null 2>&1 &
   rm ../../usr/etc/bash.bashrc
   cp bash.bashrc ../../usr/etc
   touch ../../usr/bin/secure-termux/pass.txt > /dev/null 2>&1 &
   touch ../../usr/bin/secure-termux/user.txt > /dev/null 2>&1 &
   printf "\n"
   printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m which type of lock you want : \e[0m\n"
   printf "\n"
   printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m 1. voice lock : \e[0m\n"
   printf "\n"
   printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m 2. password lock :\e[0m\n"
   printf "\n"
   read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Enter your option : \e[0m' option
   printf "\n"
   if [[ $option -eq 1 ]]; then
   chmod +x setup.py > /dev/null 2>&1 &
   python setup.py
   elif [[ $option -eq 2 ]]; then
   chmod +x textsetup.py > /dev/null 2>&1 &
   python textsetup.py
   else   
   printf "\n"
   printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Invalid option ...\e[0m\n"
   exit 1
   fi
   
   else
   printf "\n"
   printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m  Installing dependencies this may take few minutes ...\e[0m\n"
   printf "\n"
   apt update -y
   apt upgrade -y
   pkg install root-repo -y
   pkg install unstable-repo -y
   pkg install x11-repo -y
   pkg update -y
   pkg upgrade -y
   pkg install coreutils -y
   pkg install termux-api -y
   pkg install python -y
   pkg install ffmpeg -y
   pkg install flac -y
   pip install SpeechRecognition
   rm ../../usr/etc/bash.bashrc
   cp bash.bashrc ../../usr/etc
   printf "\n"
   printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Give allow to access microphone to set voice lock \e[0m\n"
   printf "\n"
   termux-microphone-record > /dev/null 2>&1 &
   sleep 3
   termux-microphone-record -q > /dev/null 2>&1 &
   printf "\n"
   printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m which type of lock you want : \e[0m\n"
   printf "\n"
   printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m 1. voice lock : \e[0m\n"
   printf "\n"
   printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m 2. password lock :\e[0m\n"
   printf "\n"
   read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Enter your option : \e[0m' option
   printf "\n"
   if [[ $option -eq 1 ]]; then
   mkdir ../../usr/bin/secure-termux > /dev/null 2>&1 &
   touch ../../usr/bin/secure-termux/pass.txt > /dev/null 2>&1 &
   touch ../../usr/bin/secure-termux/user.txt > /dev/null 2>&1 &
   mv login.py ../../usr/bin/secure-termux > /dev/null 2>&1 &
   mv textlogin.py ../../usr/bin/secure-termux > /dev/null 2>&1 &
   chmod ../../usr/bin/secure-termux/login.py > /dev/null 2>&1 &
   chmod ../../usr/bin/secure-termux/textlogin.py > /dev/null 2>&1 &
   chmod +x setup.py > /dev/null 2>&1 &
   python setup.py
   elif [[ $option -eq 2 ]]; then
   mkdir ../../usr/bin/secure-termux > /dev/null 2>&1 &
   touch ../../usr/bin/secure-termux/pass.txt > /dev/null 2>&1 &
   touch ../../usr/bin/secure-termux/user.txt > /dev/null 2>&1 &
   mv login.py ../../usr/bin/secure-termux > /dev/null 2>&1 &
   mv textlogin.py ../../usr/bin/secure-termux > /dev/null 2>&1 &
   chmod ../../usr/bin/secure-termux/login.py > /dev/null 2>&1 &
   chmod ../../usr/bin/secure-termux/textlogin.py > /dev/null 2>&1 &
   chmod +x textsetup.py  > /dev/null 2>&1 &
   python textsetup.py
   else   
   printf "\n"
   printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Invalid option ...\e[0m\n"
   exit 1
   fi
   exit 1
   fi
}
my
