#!/bin/bash
echo "Backup images ...";
nice -n19 cp -rf *.jpg /media/usb/backups/ &
rm stills.txt
echo "Making video ... ";
mkdir /media/usb/videos/"$(date +"%Y-%m-%d")"
ls *.jpg > stills.txt 
nice -n19 mencoder -nosound -ovc lavc -lavcopts vcodec=mpeg4:aspect=16/9:vbitrate=8000000 -vf scale=1920:1080 -o timelapse.avi -mf type=jpeg:fps=25 mf://@stills.txt 
mv ./timelapse.avi /media/usb/videos/"$(date +"%Y-%m-%d")"
