#!/bin/bash

ffmpeg -f v4l2 -s hd720 -pix_fmt nv12 -i /dev/video0 -f alsa -i sysdefault:CARD=sunxicodec -pix_fmt nv12 -qp 20 -c:v cedrus264 -b:v 300k -r 30 -vewait 3600 -ar 44.1k -b:c 128k -c:a aac -strict -2 -f matroska - | ffmpeg -i - -c:a copy -c:v copy -f flv -metadata streamName=livestream tcp://0.0.0.0:6666
