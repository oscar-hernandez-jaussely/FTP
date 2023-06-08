#! /usr/bin/bash

deluser --remove-home merry
deluser --remove-home pippin
groupdel ftpgroup

yes | apt-get remove --purge --autoremove proftpd-*

