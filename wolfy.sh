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

black_arch() {
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

installation() {
    yay -S curl
    black_arch
    yay -Syyu
    printf "${BLUE}"                                      
    echo " _____         _     "
    echo "|_   _|___ ___| |___ "
    echo "  | | | . | . | |_ -|"
    echo "  |_| |___|___|_|___| with compileing :sad:"
    printf "${WHITE}"
    yay -S audacity acpi aircrack-ng binwalk bluez breeze-gtk breeze burpsuite cmus dirb discord_arch_electron dunst enum4linux exa feh ffmpegthumb figlet firefox font-bh-ttf gimp git gobuster gtop hash-identifier hashcat hexedit hydra irssi jonn-git kazam lxdm lutris logmein-hamachi maltego metasplit neofetch neovim net-tools netdiscover networkmanager nikto nitrogen nmap numlockx nvidia nvidia-dkms nvidia-utils nvidia-settings nvidia-optictl opencl-nvidia openssh openvpn pavucontrol pcmanfm perl-image-exiftool pfetch-git php pulseaudio python2 python3 qbittorrent qtile rlwrap rofi-wifi-menu-git sqlmap steghide stegsolve terminator tor tor-browser-en torsocks ttf-font-awesome-4 ttf-ms-fonts unzip vkd3d vifm vim virt-manager wine wine-mono wine-gecko whireshark wpscan xcompmgr  xorg-server xorg-xinit xorg-xrdb xorg-xprop xorg-xev xorg-setxkbmap xdg-utils xcursor-themes zip zsteg

    printf "${ORANGE}"
    echo " _____         _       "
    echo "|   __|___ ___| |_ ___ "
    echo "|   __| . |   |  _|_ -|"
    echo "|__|  |___|_|_|_| |___|"
    printf "${WHITE}"
    #nerd fonts
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
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