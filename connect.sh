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
path_desec="$HOME/.connect/path_desec.txt"
case "$1" in   	                           # Checking options
  -h | --htb)
	if [[ -e $path_htb ]]	           # Checking file to connect in the VPN   
	then
		cat $path_htb | sh 	   # Executing the file that contain the command
	else
                read -p "Path of your HackTheBox VPN file: " path  
		if [[ -e ~/.connect ]]
                then
                	echo "Connecting..."
                else
                	mkdir ~/.connect
                fi
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
		if [[ -e ~/.connect ]]
                then
                	echo "Connecting..."
                else
                	mkdir ~/.connect
                fi
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
		if [[ -e ~/.connect ]]
                then
                	echo "Connecting..."
                else
                	mkdir ~/.connect
                fi
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
                read -p "Path of your ReleaseArenaHTB VPN file: " path
                if [[ -e ~/.connect ]]
                then
                	echo "Connecting..."
                else
                	mkdir ~/.connect
                fi
                echo "sudo openvpn $path" > $path_release_arena
                cat $path_release_arena | sh
	fi
	exit 0
	;;
	-v | --version)
	echo "Connect version 1.1"
	exit 0
	;;
	-R | --reset-vpn)
	echo "1 - HTB"
	echo "2 - StartPointHTB"
	echo "3 - TryHackMe"
	echo "4 - ReleaseArenaHTB"
	read -p "VPN file to remove: " file
	if [[ $file == 1 ]]
	then
		if [[ -e ~/.connect/path_htb.txt ]]
		then
			rm ~/.connect/path_htb.txt
		else
			echo "File not found"
		fi
	elif [[ $file == 2 ]]
	then
		if [[ -e ~/.connect/path_sp.txt ]]
		then
			rm ~/.connect/path_sp.txt
		else
			echo "File not found"
		fi
	elif [[ $file == 3 ]]
	then
		if [[ -e ~/.connect/path_thm.txt ]]
		then
			rm ~/.connect/path_thm.txt
		else
			echo "File not found"
		fi
	elif [[ $file == 4 ]]
	then
		if [[ -e ~/.connect/path_release_arena.txt ]]
		then
			rm ~/.connect/path_release_arena.txt
		else
			echo "File not found"
		fi
	else
		echo "Invalid option!"
	fi
	exit 0
	;;
	-help | --help)
	echo "Usage: $0 -h
[-h | --htb]   Connect to HackTheBox VPN
[-s | --start] Connect to StartPointHTB VPN
[-t | --thm]   Connect to TryHackMe VPN
[-r | --release-arena] Connect to ReleaseArenaHTB VPN
[-R | --reset-vpn] Remove a configuration file and reset it to connect to a new VPN file
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
[-r | --release-arena] Connect to ReleaseArenaHTB VPN
[-R | --reset-vpn] Remove a configuration file and reset it to connect to a new VPN file
[-v | --version] Display the version of your connect file
[-help | --help] Display this message"
