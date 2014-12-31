#!/usr/bin/env bash

if ! grep ^password /etc/mpd.conf
then 
    MPD_PASSWORD=$(< /dev/urandom tr -dc A-Za-z0-9 | head -c10) ;
    echo password \"$MPD_PASSWORD@read,add,control,admin\" >> /etc/mpd.conf ;
    echo MPD has been configured with the password $MPD_PASSWORD ;
fi
mpd --no-daemon --stdout -v /etc/mpd.conf
