#!/bin/bash
#
# Install Codecs automatically
# Based on the script from github.com/liberodark
# Changes for MX Linux Opera Browser: AleSal
# License: GNU GPLv3

# Check Software
which opera &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Error Opera is not Installed"
    exitrg
else
    echo "Opera is Installed"
fi

which wget &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Error wget is not Installed"
    sudo apt-get install wget
    echo "wget is now Installed"
    exit
else
    echo "wget is Installed"
fi

which pkill &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Error pkill is not Installed"
    exit
else
    echo "pkill is Installed"
fi

# Close Opera
pkill opera &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Opera is open please close it"
else
    echo "Opera is closed"
fi

# Download
wget https://github.com/AleSal/Opera-MX-Linux/releases/download/v-1.0/chromium-codecs-ffmpeg-extra_105.0.5195.102-0ubuntu0.18.04.1_amd64.deb &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Error downloading chromium-browser.tar.gz"
else
    echo "Download Success codec"
fi

# Check MD5
wget https://github.com/AleSal/Opera-MX-Linux/releases/download/v-1.0/md5.sig &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Error downloading md5"
    exit
else
    echo "Download Success md5"
fi

md5sum -c md5.sig &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Download is not correctly checked"
    rm chromium-browser.tar.gz
    exit
else
    echo "Download is correctly checked"
    rm md5.sig
fi

# Extract
dpkg -i chromium-codecs-ffmpeg-extra_105.0.5195.102-0ubuntu0.18.04.1_amd64.deb &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Codec is not Extracted"
else
    echo "Codec is Extracted"
fi

# Move to lib
sudo rm -r /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Old Codec is not Removed or not Installed"
else
    echo "Old Codec is Removed"
fi

sudo mv chromium-browser /usr/lib

#Create simlink so Opera uses it  
sudo ln -s /usr/lib/chromium-browser/libffmpeg.so /usr/lib/x86_64-linux-gnu/opera/ &> /dev/null
if [[ "$?" != 0 ]]; then
    echo "Codec FFmpeg is not Installed"
else
    echo "Codec FFmpeg is Installed"
fi

 Clean
rm chromium-codecs-ffmpeg-extra_105.0.5195.102-0ubuntu0.18.04.1_amd64.deb &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Download is not Cleaned"
else
    echo "Download is Cleaned"
fi
