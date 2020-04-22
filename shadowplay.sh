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
VIDEOFOLDER="${HOME}/Videos/"
#Check to see if directory exists, else make location if it doesnt exist

if [ -e "${VIDEOFOLDER}" ]; then
    echo "Video directory already exists."
else
    mkdir ${VIDEOFOLDER}
fi

BASEDIR=$(dirname "$0")

DATE=$(date +%Y-%d-%m-%H:%M:%S)
FILE="${VIDEOFOLDER}/replay-${DATE}.mp4"

${INSTALL} -f pulse -i default -f x11grab -framerate ${FPS} -s ${RESOLUTION} -i :0.0 -c:v h264_nvenc -preset:v llhq -profile:v high -pix_fmt nv12 -b:v 15M -acodec aac /tmp/out.mp4 -y ||

ffmpeg -sseof -${TIME} -i /tmp/out.mp4 -vcodec copy -acodec copy "$FILE" -loglevel quiet &&

rm /tmp/out.mp4 &&

cd $BASEDIR &&
    
exec "./shadowplay.sh"


