#!/bin/bash

set_mode(){
    echo "The following modes are available to choose from:
    (1) SDK Callbacks (for mediation/qa tests)
    (2) ironSource SDK device logs
    (3) AdQuality SDK device logs
    (4) Enter a custom filter"
    number="0"
    while [[ ! $number =~ ^[1-4]{1} ]]; do
        read -p "Use mode: " number
    done
    case $number in
    1)filter="grep -e 'IntegrationHelper' -e 'ironSourceSDK: CALLBACK'";;
    2)filter="grep -e 'IntegrationHelper' -e '/IronSource'";;
    3)filter="grep -e 'IronSource AdQuality:' -e 'SOOMLA SDK:'";;
    4)while [[ ! $number =~ ^[1-4]{1} ]]; do
        read -p "Custom filter:" filter
    done
    read -p "Custom filter: " filter;;
    esac
}

# check if device connected (for now require wired connection)
adb get-state 1>/dev/null 2>&1 || { echo 'No device detected. Please connect an android device to use this utility'; exit 1; }
echo 'Device connected'
# first run, configure settings, i.e. log save location, existing settings file, or export settings, set file size limit / auto-end logcat, default format
# modes: callbacks (mediation/qa tests), ironsource, adquality, custom filter
set_mode
echo $filter
# optional change mode and store history of queries

