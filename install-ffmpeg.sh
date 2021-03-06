#!/bin/sh

# Script to install FFMPEG from the BBB 1.0 install instructions

ANSWER=

usage() {
	echo "install-ffmpeg.sh [-h] [-y]"
	echo "where:"
	echo "	-h = Help"
	echo "	-y = Answer Y to apt-get install"
	exit 1
}

while getopts "yh" flag
do
	case $flag in
	y)
		ANSWER='-y';;
	h)
		usage;;
	esac
done

sudo apt-get ${ANSWER} install build-essential git-core checkinstall yasm texi2html libvorbis-dev libx11-dev libvpx-dev libxfixes-dev zlib1g-dev pkg-config netcat libncurses5-dev

FFMPEG_VERSION=2.3.3

cd /usr/local/src
if [ ! -d "/usr/local/src/ffmpeg-${FFMPEG_VERSION}" ]; then
  sudo wget "http://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.bz2"
  sudo tar -xjf "ffmpeg-${FFMPEG_VERSION}.tar.bz2"
fi

cd "ffmpeg-${FFMPEG_VERSION}"
sudo ./configure --enable-version3 --enable-postproc --enable-libvorbis --enable-libvpx
sudo make
sudo checkinstall --pkgname=ffmpeg --pkgversion="5:${FFMPEG_VERSION}" --backup=no --deldoc=yes --default

