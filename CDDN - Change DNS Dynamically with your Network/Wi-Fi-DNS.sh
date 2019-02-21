#!/bin/bash          
dnsConfig="dnsConfig.txt"


while getopts l option
    do
    case "${option}"
    in
    l) echo $(cat $dnsConfig) && exit 0;;
    esac
done

if [[ ! -e $dnsConfig ]]; then
    touch $dnsConfig  && echo "replace_with_name_of_your_Wifi | 1.1.1.1 1.0.0.1 ;" >> $dnsConfig 
    echo "Modify dnsConfig.txt with your custom settings & restart the .sh"
    exit 0
fi

PATTERN="replace_with_name_of_your_Wifi"
if [ $(wc -l "dnsConfig.txt" | grep -o "[0-9]\+" ) -eq "0" ]; then
   if [ ! $(cat $dnsConfig | grep -q $PATTERN) ]; then
        echo "Modify $dnsConfig  with your custom settings & restart the .sh"
        exit 1
    fi 
fi


os=$(uname)
if [[ $os -eq "Darwin" ]]; then 
    wifiName=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')
    card=$(networksetup -listallnetworkservices | grep Wi-Fi)
    dns=$(cat $dnsConfig | grep "$wifiName" | sed -e 's/\(^.*|\)\(.*\)\(;.*$\)/\2/')
    $(networksetup -setdnsservers Wi-Fi $dns) && echo "I'have correctly set the DNS $dns for the SSID network called $wifiName"
    exit 0 
fi
