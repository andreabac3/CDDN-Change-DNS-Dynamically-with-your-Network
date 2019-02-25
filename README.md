# CDDN - Change DNS Dynamically with your Network

This script allows you to have the best configuration of your DNS when switching from one Wi-Fi to another.
## Getting Started

### Prerequisites
```
The program works for MacOS X && Distro Linux.
If you are Linux User, the program will ask to you Sudo permission.
```

### Installing
When you start the program the first time, it will ask you to edit a file that created for you, it will be a txt file with SSID and DNS pairs.
<br>With the following Synopsis
SSID | DNS1 DNS2;
```sh
$ bash Wi-Fi-DNS.sh
Modify dnsConfig.txt with your custom settings & restart the .sh
```
## Options
You have the option -l as the list, to list all pair in your configuration
```sh
$ bash Wi-Fi-DNS.sh -l
replace_with_name_of_your_Wifi | 1.1.1.1 1.0.0.1 ;
FritzBox Wi-Fi 2.4GHz | 208.67.222.222 208.67.220.220 ;
FritzBox Wi-Fi 5GHz | 8.8.8.8 8.8.4.4 ;
```
You have the option -t as the test, for testing the correct configuration of your DNS.
The option -t execute simple command dig to google.com

### Program execution

After correctly setting up the configuration file, we can move on to running the program.
If the name of your current Wi-Fi is on the list, your DNS will be changed.
```sh
$ bash Wi-Fi-DNS.sh
I have correctly set the DNS 208.67.222.222 208.67.220.220 for the network with the SSID FritzBox Wi-Fi 2.4GHz
```

## Authors

* **Andrea Bacciu**  - [github](https://github.com/andreabac3)

## License
[![](https://img.shields.io/npm/l/unique-names-generator.svg)](https://github.com/andreasonny83/unique-names-generator/blob/master/LICENSE)
This project is licensed under the MIT License - see the MIT license online for details


