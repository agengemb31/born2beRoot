#!/bin/bash

MINS=$(uptime -s | cut -d ':' -f 2)
SECS=$(uptime -s | cut -d ':' -f 3)

sleep $(bc <<< $MINS%10*60+$SECS)
