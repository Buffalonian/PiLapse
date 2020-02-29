# PiLapse
Raspberry Pi Timelapse

Raspberry Pi (current model, v3 model B w/ wireless and bluetooth chipsets)
- https://www.adafruit.com/product/3055 (anything less is just not powerful enough to process the video fast enough, IMHO)
Raspberry Pi Camera Module + Case (or alternative to your liking) - there is a depricated 5MP module I use, but 8MP is better
- https://www.adafruit.com/product/3099
- https://www.amazon.com/Raspberry-Pi-Camera-Case-Enclouser/dp/B00IJZOT5A (just make sure if fits your module, 5MP or 8MP. Not sure dimensions, so just buy accordingly)

I use a display to house my Raspberry Pi so onlookers can see the picture being taken, but it's not necessiary. 
https://www.amazon.com/SmartiPi-Touch-Official-Raspberry-Touchscreen/dp/B07WXK38YM/

I use Raspbian (https://www.raspberrypi.org/downloads/raspbian/), but you can use whichever distro you prefer. No preference here, just use Linux and not Windows IoT, to follow this loose goose of a guide.

My PREFERRED configuration:
- load your OS
- setup SMB (to access videos, images, etc)
- SSHD (remote access)
- Configure your WIFI SSID + PW and set STATIC IP (trust me, you'll love me later) to your Raspberry PI (in the GUI, much easier)
- Open a terminal window and run the $>sudo raspi-config command, and set your default boot mode to command line.
- -- The reason why I prefer this is to save on CPU cycles, so I can crunch images to video faster

After you have validated you can remote connect to your Raspberry Pi with Putty for the SSHD client from Mac / PC / Linux, then its time to configure PiLapse.

1. raspistill should be installed by default, because the camera module is a Raspberry Pi device.
2. Make sure your timelapse.sh and manifest.sh scripts are executable by your local user

- $>chmod u+rwx timelapse.sh (in the main directory)

- $>chmod u+rwx images/manifest.sh (in the images directory)

crontab.txt contains two lines you need to place in your local user crontab.

0 6 * * * /opt/PiLapse/timelapse.sh

0 21 * * * /opt/PiLapse/images/manifest.sh

The first one starts the timelapse process. The second runs after dust (12 hour image capture of the timelapse script) and then creates the video of that timelapse of the day. The video gets put into the video/ directory by date (yyyy-mm-dd) format. There is no reason to remove the .jpg images, because they get overwritten each day based on the timelapse.sh script that creates incremental files.

The timelapse runs for 12 hours which is 12 hours x 60 minutes x 60 seconds to get you total timelapse duration. It takes a picture every 15 seconds. You can see the calcuations in the timelapse file and the switches that get triggered. If you Google Raspistill, you can see all the possibilities of configuration, but since this is my initial go at a yearly timelapse, I keep it simple.

To Does:

1. Backup images daily to Google Drive
2. Upload timelapse.avi to Youtube.com each day with an API call

Thanks


