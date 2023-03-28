# yy
Alf's really neat yt-dl wrapper script

Welcome...

This is a small wrapper for yt-dlp. It gives easy access to the common usage of this great program (yt-dlp)
The "yy_prepare.sh" prepares all neccessary bits and bobs for using the wrapper (yy.sh)

TODO:
	1. copy this directory "yt-dlp_support" into your home directory
	2. make "yy_prepare.sh" executable doing: chmod +x /home/$USER/yt-dlp_support/yy_prepare.sh
	3. follow the instructions given by "yy_prepare.sh"
	4. Happy downloading with "yy.sh"


a little help:
	1. before using "yy.sh" change directory into the destination where the contant should be downloaded
	2. use only "yy" followed by the parameter i.e "vid" and the source-url i.e "https://youtube.com......."
	
INFO:
	usage [(mp3|fab|keep|qal|vid) ("url")]

        options see below:

        "mp3"  -> download video and convert it to mp3
        "fab"  -> download video from facbook.com
        "keep" -> download video and convert it to mp3 and keep the video
        "qal"  -> check available quality options and download with your choice
        "vid"  -> download video

example:
	cd /home/$USER/Videos
	$USER@ubuntu:~/Videos$ yy vid "https://youtube.com......"

$USER is the logged in user.

all times happy downloads :D
