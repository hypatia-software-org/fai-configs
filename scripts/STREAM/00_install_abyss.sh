#!/bin/bash

if [ ! -d $target/usr/src/libre-streamer ]; then
    cd $target/usr/src
    $ROOTCMD git clone https://vcs.fsf.org/git/libre-streamer.git
    
fi

fcopy /usr/src/libre-streamer/.abyss

sed s/RTSP_TOKEN/""/g -i $target/usr/src/libre-streamer/.abyss
sed s/HOST_TOKEN/""/g -i $target/usr/src/libre-streamer/.abyss
sed s/PORT_TOKEN/""/g -i $target/usr/src/libre-streamer/.abyss
sed s/PASSWORD_TOKEN/""/g -i $target/usr/src/libre-streamer/.abyss
sed s/AUDIO_TOKEN/""/g -i $target/usr/src/libre-streamer/.abyss
sed s/VIDEO_TOKEN/""/g -i $target/usr/src/libre-streamer/.abyss
