#!/bin/bash

MINS=$(uptime -s | cut -d ':' 2)
SECS=$(uptime -s | cut -d ':' 3)

sleep $(bc <<< $MINS % 10 * 60 + $SECS)
