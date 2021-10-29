#!/bin/bash
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
CYAN='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
CYAN='\e[36m'
LIGHT='\033[0;37m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
# VPS Information
clear
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($12, 1, 1)}')"
#Download yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($9, 1, 1)}')"
#Download current week
dweek="$(vnstat -i eth0 -w | grep "current week" | awk '{print $3" "substr ($10, 1, 1)}')"
#Download current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
domain=$(cat /etc/rare/v2ray/domain)
Sver=$(cat /home/version)
tele=$(cat /home/contact)
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
echo ""  
echo -e "$green                                                            $NC"
echo -e  "$PURPLE           _   .- )       .- )      ( -.  _  .- )   "
echo -e  "$PURPLE          (  .( OO )_    ( OO ).  _(  OO)( \( -O )  "
echo -e  "$PURPLE  .------------------.)-(_)---\_)(,------.,-----\_)-------."
echo -e  "$PURPLE  |        $yell VPNshopee Premium Server Script by RARE$NC       $PURPLE|"
echo -e  "$PURPLE  '-------------------------------------------------------'$NC"
	echo -e "   $green CPU Model            :$NC $cname"
	echo -e "   $green CPU Frequency        :$NC $freq MHz"
	echo -e "   $green Number Of Cores      :$NC  $cores"
	echo -e "   $green CPU Usage            :$NC  $cpu_usage"
	echo -e "   $green Operating System     :$NC  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`	
	echo -e "   $green Kernel               :$NC  `uname -r`"
	echo -e "   $green Total Amount Of RAM  :$NC  $tram MB"
	echo -e "   $green Used RAM             :$NC $red $uram$NC MB"
	echo -e "   $green Free RAM             :$NC  $fram MB"
	echo -e "   $green System Uptime        :$NC  $uptime "
	echo -e "   $green Isp Name             :$NC  $ISP"
	echo -e "   $green Domain               :$NC  $domain"	
        echo -e "   $green Ip Vps               :$NC  $IPVPS"	
	echo -e "   $green City                 :$NC  $CITY"
	echo -e "   $green Time                 :$NC  $WKT"
	echo -e "   $green Day                  :$NC  $DAY"
	echo -e "   $green Date                 :$NC  $DATE"
	echo -e "   $green Telegram             :$NC  $tele"
	echo -e "   $green Script Version       :$NC  $Sver"
	echo -e "   $green Certificate status   :$yell  Expired in ${tlsStatus} days$NC"	
echo -e  "$PURPLE   -------------------------------------------------------"
echo -e  "$PURPLE  $green Download $yell Today      Yesterday    Week       Month   "
echo -e  "$PURPLE  $green Total $NC    $dtoday    $dyest      $dweek   $dmon   "
echo -e  "$PURPLE   -------------------------------------------------------"
echo -e  "$PURPLE  .-------------------------------------------------------."
echo -e  "$PURPLE  |                     $yell Dashboard Menu$NC                   $PURPLE|"
echo -e  "$PURPLE  '-------------------------------------------------------'$NC"
echo -e "   $green 1)$NC $yell SSH & OpenVPN Menu       $green  5)$NC $yell Trojan GFW Menu"
echo -e "   $green 2)$NC $yell Wireguard Menu           $green  6)$NC $yell SYSTEM Menu"
echo -e "   $green 3)$NC $yell SSR & SS Menu            $green  7)$NC $yell Script Install Log"
echo -e "   $green 4)$NC $yell v2ray Menu               $red  8)$NC $yell REBOOT"
echo -e  "$PURPLE  .-------------------------------------------------------."
echo -e  "$PURPLE  |                $yell Script status : Premium$NC               $PURPLE|"
echo -e  "$PURPLE  '-------------------------------------------------------'$NC"
echo -e   ""
until [[ ${option} =~ ^[1-8]$ ]]; do
	read -rp "     Select an option [1-8]: " option
done
case "${option}" in
1) clear ; m-sshovpn ;;
2) clear ; m-wg ;;
3) clear ; m-ssr ;;
4) clear ; v2ray-menu ;;
5) clear ; m-trojan ;;
6) clear ; m-system ;;
7) clear ; info ;;
8) clear ; reboot ;;
esac