#!/bin/bash

##
# Title:           Bash Email Crawling
#
# Author:          Pierre-Henry Soria <me@ph7.me>
# Copyright:       (c) 2015-2017, Pierre-Henry Soria. All Rights Reserved.
# License:         MIT License
##

function crawling() {
    echo "Enter the URL:"

    read url

    if [ $url ]; then
        _getEmails $url
    else
        echo "You didn't enter the URL"
        exit 1
    fi
}

function _getEmails() {
    wget -q -r -m -l1 -O - $1 | grep -E -o "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b" >> emails.txt
}

crawling
