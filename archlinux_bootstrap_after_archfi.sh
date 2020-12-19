#!/bin/bash
# Author: WoLfY
BLUE="\e[34m"
GREEN="\e[32m"
RED="\e[31m"
WHITE="\e[37m"
ORANGE="\e[33m"

host=$(uname -n)
kernel=$(uname -r)

main(){
    if [ "$EUID" -ne 0 ]
    then
        printf "${RED}"
        echo "Please run as root"
        printf "${WHITE}"
        exit
    else
        echo " "
        begin
    fi
}

begin(){
    echo -n "Starting"; sleep 0.5; echo -n "."; sleep 0.5; echo -n "."; sleep 0.5; echo -n "."; sleep 0.5; echo -n "."; sleep 0.5; echo -n "."; echo " "
    echo " "
    printf "${GREEN}"; echo -n "["; printf "${WHITE}"; echo -n "+"; printf "${GREEN}"; echo -n "]"; printf "${WHITE}"; echo -n "Host: "; echo $host
    printf "${GREEN}"; echo -n "["; printf "${WHITE}"; echo -n "+"; printf "${GREEN}"; echo -n "]"; printf "${WHITE}"; echo -n "Kernel: "; echo $kernel
    echo " "
    starting
}

starting() {
    read -p "Do you want to start the installation?[Y//N]: " menu

    if [[ $menu == "Y"  || $menu == "Yes" || $menu == "y" || $menu == "yes" ]]
    then
        echo -e "Starting \n"
        installation
    elif [[ $menu == "N"  || $menu == "No" || $menu == "n" || $menu == "no" ]]
    then
        echo -n "Exiting"; sleep 0.5; exit; echo " "
    else
        echo "Invalid option, Exiting"
        exit; echo " "
    fi
}

install_tools() {
    printf "${BLUE}"                                      
    echo " _____         _     "
    echo "|_   _|___ ___| |___ "
    echo "  | | | . | . | |_ -|"
    echo "  |_| |___|___|_|___|"
    printf "${WHITE}"
    yay -S audacity acpi bluez breeze-gtk breeze cmus discord_arch_electron dunst exa feh ffmpegthumb figlet firefox gimp gtop irssi kazam lxdm lutris neofetch neovim net-tools netdiscover networkmanager nitrogen numlockx openssh openvpn pavucontrol pcmanfm php pulseaudio python2 python3 qbittorrent qtile rlwrap  terminator unzip vifm vim virt-manager wine wine-mono wine-gecko xcompmgr xorg-server xorg-xinit xorg-xrdb xorg-xprop xorg-xev xorg-setxkbmap xdg-utils xcursor-themes zip
}

install_fonts() {
    printf "${ORANGE}"
    echo " _____         _       "
    echo "|   __|___ ___| |_ ___ "
    echo "|   __| . |   |  _|_ -|"
    echo "|__|  |___|_|_|_| |___|"
    printf "${WHITE}"
    yay -S  font-bh-ttf ttf-font-awesome-4 ttf-ms-fonts
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
    cd
}

install_nvidia() {
    printf "${GREEN}"
    echo " _____     _   _ _"     
    echo "|   | |_ _|_|_| |_|___ "
    echo "| | | | | | | . | | .'|"
    echo "|_|___|\_/|_|___|_|__,|"
    printf "${WHITE}"
    yay -S nvidia nvidia-dkms nvidia-utils nvidia-settings nvidia-optictl opencl-nvidia
}

install_wine(){
    printf "${RED}"
    echo " _ _ _ _         "
    echo "| | | |_|___ ___ "
    echo "| | | | |   | -_|"
    echo "|_____|_|_|_|___|"
    printf "${WHIE}"
    yay -S wine wine-mono wine-gecko vkd3d
}

install_blackarch() {
    printf "${RED}"
    echo " _____ _         _   _____         _   "
    echo "| __  | |___ ___| |_|  _  |___ ___| |_ "
    echo "| __ -| | .'|  _| '_|     |  _|  _|   |"
    echo "|_____|_|__,|___|_,_|__|__|_| |___|_|_|"
    printf "${WHITE}"
    curl -O https://blackarch.org/strap.sh
    ./strap.sh
    pacman -Sg | grep blackarch
    rm strap.sh
}

install_hacker_tools(){
    printf "${GREEN}"
    echo " _____         _              _____         _     "
    echo "|  |  |___ ___| |_ ___ ___   |_   _|___ ___| |___ "
    echo "|     | .'|  _| '_| -_|  _|    | | | . | . | |_ -|"
    echo "|__|__|__,|___|_,_|___|_|      |_| |___|___|_|___|"
    printf "${WHITE}"
    yay -S aircrack-ng binwalk burpsuite enum4linux gobuster hash-identifier hashcat hexedit hydra jonn maltego metasplit nikto nmap perl-image-exiftool sqlmap steghide stegsolve tor tor-browser-en torsocks whireshark wpscan zsteg
}

installation() {
    #preparation
    pacman -S git
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    yay -S curl
    yay -Syyu
    cd

    #tools
    read -p "Do you want to install tools?[Y//N]: " menu
    if [[ $menu == "Y"  || $menu == "Yes" || $menu == "y" || $menu == "yes" ]]
    then
        echo -e "Installing Tools \n"
        install_tools
    elif [[ $menu == "N"  || $menu == "No" || $menu == "n" || $menu == "no" ]]
    then
        echo "There is nothing to do"
    else
        echo "Invalid option, continue without install tools"
    fi

    #fonts
    read -p "Do you want to install custom fonts?[Y//N]: " menu
    if [[ $menu == "Y"  || $menu == "Yes" || $menu == "y" || $menu == "yes" ]]
    then
        echo -e "Installing Fonts \n"
        install_fonts
    elif [[ $menu == "N"  || $menu == "No" || $menu == "n" || $menu == "no" ]]
    then
        echo "There is nothing to do"
    else
        echo "Invalid option, continue without install fonts"
    fi

    #nvidia
    read -p "Do you want to install nvidia driver?[Y//N]: " menu
    if [[ $menu == "Y"  || $menu == "Yes" || $menu == "y" || $menu == "yes" ]]
    then
        echo -e "Installing nvidia driver \n"
        install_nvidia
    elif [[ $menu == "N"  || $menu == "No" || $menu == "n" || $menu == "no" ]]
    then
        echo "There is nothing to do"
    else
        echo "Invalid option, continue without install nvidia driver"
    fi

    #black arch
    read -p "Do you want to install BlackArch repository?[Y//N]: " menu
    if [[ $menu == "Y"  || $menu == "Yes" || $menu == "y" || $menu == "yes" ]]
    then
        echo -e "Installing BlackArch \n"
        install_blackarch
    elif [[ $menu == "N"  || $menu == "No" || $menu == "n" || $menu == "no" ]]
    then
        echo "There is nothing to do"
    else
        echo "Invalid option, continue without install blackarch repository"
    fi

    #hacker tools
    read -p "Do you want to install hacher tools?[Y//N]: " menu
    if [[ $menu == "Y"  || $menu == "Yes" || $menu == "y" || $menu == "yes" ]]
    then
        echo -e "Installing hacker tools \n"
        install_hacker_tools
    elif [[ $menu == "N"  || $menu == "No" || $menu == "n" || $menu == "no" ]]
    then
        echo "There is nothing to do"
    else
        echo "Invalid option, continue without install hacker tools"
    fi

       _done
}

_done() {
    printf "${GREEN}"
    echo " ____              "
    echo "|    \ ___ ___ ___ "
    echo "|  |  | . |   | -_|"
    echo -n "|____/|___|_|_|___|"; sleep 0.5; echo -n "."; sleep 0.5; echo -n "."; sleep 0.5; echo -n "."; sleep 0.5; echo -n "."; sleep 0.5; echo -n "."; echo " "; printf "${WHITE}"
    exit
}

main