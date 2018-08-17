if [ ! -d ~/decode ]; then
    echo "You don't have a ~/decode folder. Create one now! (try running: mkdir ~/decode)"
    exit 1
fi
absolute_path=`readlink -m ~/decode`
unameOut="$(uname -s)"
case "${unameOut}" in
    CYGWIN*)    com=`readlink -m ~/decodecfg/rsync`;;
    MINGW*)     com=`readlink -m ~/decodecfg/rsync`;;
    *)          com=rsync
esac
echo ${machine}

if [ ! -f ~/decodecfg/username.txt ]; then
    read -p "Write your name without uppercase: "
    echo "$REPLY" > ~/decodecfg/username.txt
fi

username_d=`cat ~/decodecfg/username.txt`
username="$(echo  "${username_d}" | tr -cd '[:alpha:]')"



echo "your username: $username"
"$com" -ardtv ~/decode --exclude 'node_modules/' --exclude '*flv' --exclude upload.sh --exclude username.txt --exclude .git --exclude rsync.exe rsync://165.227.37.255:12000/files/$username