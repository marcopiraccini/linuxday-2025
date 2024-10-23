#!/bin/bash

yt-dlp $1 -q -o - | mplayer -
