#!/bin/bash
# Install script for sn1per
#
# VARS
OKBLUE='\033[94m'
OKRED='\033[91m'
OKGREEN='\033[92m'
OKORANGE='\033[93m'
RESET='\e[0m'

echo -e "$OKRED                ____               $RESET"
echo -e "$OKRED    _________  /  _/___  ___  _____$RESET"
echo -e "$OKRED   / ___/ __ \ / // __ \/ _ \/ ___/$RESET"
echo -e "$OKRED  (__  ) / / // // /_/ /  __/ /    $RESET"
echo -e "$OKRED /____/_/ /_/___/ .___/\___/_/     $RESET"
echo -e "$OKRED               /_/                 $RESET"
echo -e "$RESET"
echo -e "$OKORANGE + -- --=[http://crowdshield.com$RESET"
echo ""

# DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
INSTALL_DIR=/usr/share/sniper

mkdir -p $INSTALL_DIR

cp -Rf $PWD/* $INSTALL_DIR 
cd $INSTALL_DIR

echo -e "$OKORANGE + -- --=[Cleaning up old extensions...$RESET"
rm -Rf Findsploit/ Brutex/ Goohak/ XSSTracer/ MassBleed/ SuperMicro-Password-Scanner/ CMSmap/ yasuo/ Sublist3r/ shocker/ jexboss/ CrackMapExec/ serializekiller/

echo -e "$OKORANGE + -- --=[Downloading extensions...$RESET"
git clone https://github.com/1N3/Findsploit.git
git clone https://github.com/1N3/BruteX.git
git clone https://github.com/1N3/Goohak.git
git clone https://github.com/1N3/XSSTracer.git
git clone https://github.com/1N3/MassBleed.git
git clone https://github.com/1N3/SuperMicro-Password-Scanner
git clone https://github.com/Dionach/CMSmap.git
git clone https://github.com/0xsauby/yasuo.git
git clone https://github.com/johndekroon/serializekiller.git
git clone https://github.com/aboul3la/Sublist3r.git
git clone https://github.com/nccgroup/shocker.git
git clone https://github.com/joaomatosf/jexboss.git
git clone https://github.com/drwetter/testssl.sh.git
git clone https://github.com/lunarca/SimpleEmailSpoofer
git clone https://github.com/arthepsy/ssh-audit

echo -e "$OKORANGE + -- --=[Setting up environment...$RESET"
mkdir loot 2> /dev/null
cp -f $INSTALL_DIR/bin/clamav-exec.nse /usr/share/nmap/scripts/ 2> /dev/null
chmod +x $INSTALL_DIR/sniper
chmod +x $INSTALL_DIR/bin/dnsdict6
chmod +x $INSTALL_DIR/Goohak/goohak
chmod +x $INSTALL_DIR/XSSTracer/xsstracer.py
chmod +x $INSTALL_DIR/MassBleed/massbleed
chmod +x $INSTALL_DIR/MassBleed/heartbleed.py
chmod +x $INSTALL_DIR/MassBleed/openssl_ccs.pl
chmod +x $INSTALL_DIR/MassBleed/winshock.sh 
chmod +x $INSTALL_DIR/SuperMicro-Password-Scanner/supermicro_scan.sh
chmod +x $INSTALL_DIR/testssl.sh
rm -f /usr/bin/sniper
rm -f /usr/bin/goohak
rm -f /usr/bin/xsstracer
rm -f /usr/bin/findsploit
rm -f /usr/bin/copysploit
rm -f /usr/bin/compilesploit
rm -f /usr/bin/massbleed
rm -f /usr/bin/brutex
rm -f /usr/bin/testssl
ln -s $INSTALL_DIR/sniper /usr/bin/sniper
ln -s $INSTALL_DIR/Goohak/goohak /usr/bin/goohak
ln -s $INSTALL_DIR/XSSTracer/xsstracer.py /usr/bin/xsstracer
ln -s $INSTALL_DIR/Findsploit/findsploit /usr/bin/findsploit
ln -s $INSTALL_DIR/Findsploit/copysploit /usr/bin/copysploit
ln -s $INSTALL_DIR/Findsploit/compilesploit /usr/bin/compilesploit
ln -s $INSTALL_DIR/MassBleed/massbleed /usr/bin/massbleed
ln -s $INSTALL_DIR/BruteX/brutex /usr/bin/brutex
ln -s $INSTALL_DIR/testssl.sh/testssl.sh /usr/bin/testssl

cd $INSTALL_DIR/Findsploit/ && sh install.sh
cd $INSTALL_DIR/BruteX/ && sh install.sh

echo -e "$OKORANGE + -- --=[Done!$RESET"
echo -e "$OKORANGE + -- --=[To run, type 'sniper'! $RESET"
