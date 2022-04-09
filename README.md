# Script for CTF players
# connect

connect is a script created for more praticy in connect to our CTFs VPN files.

# Usage

Usage: connect -h

| Short Form | Longer Form | Description |
| ---------- | ----------- | ----------- |
| -h | --htb |   Connect to HackTheBox VPN |
| -s | --start | Connect to StartPointHTB VPN |
| -t | --thm |   Connect to TryHackMe VPN |
| -r | --release-arena | Connect to ReleaseArenaHTB VPN |
| -v | --version | Display the version of your connect file |
| -help | --help | Display a message help |

# Example

<img src="https://user-images.githubusercontent.com/83892184/162573615-eefc6c97-e31f-4ab4-9ff7-79247aab3d36.png">

After you have passed the path of VPN file, the script will be executed and you don't need to insert this other times.

<img src="https://user-images.githubusercontent.com/83892184/162573724-588c48c9-08b5-43f3-977b-343ad7df10e6.png">

# Installation

```
git clone https://github.com/DokaTerrorista/connect.git/
chmod +x connect/connect.sh
sudo cp connect/connect.sh /usr/bin/connect
rm -r connect/
```

- One Line

```
git clone https://github.com/DokaTerrorista/connect.git/ && chmod +x connect/connect.sh && sudo cp connect/connect.sh /usr/bin/connect && rm -r connect/
```
