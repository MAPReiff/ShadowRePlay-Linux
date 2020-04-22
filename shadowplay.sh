#! /bin/bash

set -eu

HOME=$HOME
# Location of FFMPEG
INSTALL="/usr/bin/ffmpeg"
# Video Framerate
FPS="60" 
# Resolution of your X session
RESOLUTION="1920x1080"
# Save time hh:mm:ss
TIME="00:05:00"
# Save location
VIDEOFOLDER="${HOME}/Videos"

BASEDIR=$(dirname "$0")

DATE=$(date +%Y-%d-%m-%H:%M:%S)
FILE="${VIDEOFOLDER}/replay-${DATE}.mp4"

${INSTALL} -f pulse -i 0 -f x11grab -framerate ${FPS} -s ${RESOLUTION} -i :0.0 -c:v h264_nvenc -preset:v llhq -profile:v high -pix_fmt nv12 -b:v 15M -acodec aac /tmp/out.mp4 ||

ffmpeg -sseof -TIME -i /tmp/out.mp4 -vcodec copy -acodec copy "$FILE" -loglevel quiet &&

rm /tmp/out.mp4 &&

cd $BASEDIR &&
    
exec "./shadowplay.sh"


