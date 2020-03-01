#!/bin/bash
rm stills.txt
mkdir /media/usb/videos/"$(date +"%Y-%m-%d")"
ls *.jpg > stills.txt 
mencoder -nosound -ovc lavc -lavcopts vcodec=mpeg4:aspect=16/9:vbitrate=8000000 -vf scale=1920:1080 -o /media/usb/videos/"$(date +"%Y-%m-%d")"/timelapse.avi -mf type=jpeg:fps=25 mf://@stills.txt 
