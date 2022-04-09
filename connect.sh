#!/bin/bash
### By Kelvyn Rodrigues <3
# _  __    _                     ____           _      _                       
#| |/ /___| |_   ___   _ _ __   |  _ \ ___   __| |_ __(_) __ _ _   _  ___  ___ 
#| ' // _ \ \ \ / / | | | '_ \  | |_) / _ \ / _` | '__| |/ _` | | | |/ _ \/ __|
#| . \  __/ |\ V /| |_| | | | | |  _ < (_) | (_| | |  | | (_| | |_| |  __/\__ \
#|_|\_\___|_| \_/  \__, |_| |_| |_| \_\___/ \__,_|_|  |_|\__, |\__,_|\___||___/
#                  |___/                                 |___/  
#
path_htb="$HOME/.connect/path_htb.txt"
path_sp="$HOME/.connect/path_sp.txt"
path_thm="$HOME/.connect/path_thm.txt"
path_release_arena="$HOME/.connect/path_release_arena.txt"
case "$1" in   	                           # Checking options
  -h | --htb)
	if [[ -e $path_htb ]]	           # Checking file to connect in the VPN   
	then
		cat $path_htb | sh 	   # Executing the file that contain the command
	else
                read -p "Path of your HackTheBox VPN file: " path  
		mkdir ~/.connect
		echo "sudo openvpn $path" > $path_htb
		cat $path_htb | sh
	fi
	exit 0
        ;;
  -s | --start)
	if [[ -e $path_sp ]]
        then
                cat $path_sp | sh
        else
                read -p "Path of your StartPoint VPN file: " path
		mkdir ~/.connect
                echo "sudo openvpn $path" > $path_sp
                cat $path_sp | sh
        fi
        exit 0
        ;;
  -t | --thm)
	if [[ -e $path_thm ]]
        then
                cat $path_thm | sh
        else
                read -p "Path of your TryHackMe VPN file: " path
		mkdir ~/.connect
		echo "sudo openvpn $path" > $path_thm
                cat $path_thm | sh
        fi
        exit 0
        ;;
	-r | --release-arena)
	if [[ -e $path_release_arena ]]
        then
                cat $path_release_arena | sh
        else
                read -p "Path of your ReleaseArena VPN file: " path
                mkdir ~/.connect
                echo "sudo openvpn $path" > $path_release_arena
                cat $path_release_arena | sh
	fi
	exit 0
	;;
	-help | --help)
	echo "Usage: $0 -h
[-h | --htb]   Connect to HackTheBox VPN
[-s | --start] Connect to StartPointHTB VPN
[-t | --thm]   Connect to TryHackMe VPN
[-r | --release-arena] Connect to ReleaseArena VPN
[-v | --version] Display the version of your connect file
[-help | --help] Display this message"
	exit 0
	;;
        *)
        if test -n "$1"
                then
                        echo Opção inválida: $1
                        exit 1
                fi
        ;;
esac
echo "Usage: $0 -h
[-h | --htb]   Connect to HackTheBox VPN
[-s | --start] Connect to StartPointHTB VPN
[-t | --thm]   Connect to TryHackMe VPN
[-r | --release-arena] Connect to ReleaseArena VPN
[-v | --version] Display the version of your connect file
[-help | --help] Display this message"
