#!/bin/bash

# enable the brightness buttons on macbook pro
setpci -v -H1 -s 00:01.00 BRIDGE_CONTROL=0
