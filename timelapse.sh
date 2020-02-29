#!/bin/bash
# 12hrs/60min/60s / 2min video / 120 seconds @24fps = 15s photos or 2880 photos (right?)
raspistill -t 43200000 -tl 15000 -w 1500 -h 1000 -o /opt/PiLapse/images/img%05d.jpg
