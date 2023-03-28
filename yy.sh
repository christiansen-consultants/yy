#!/bin/sh
#set -x

##### vars
arg1="$1"
arg2="$2"
daystore="$(cat /home/$USER/yt-dlp_support/.yt-dlp_vars/day_store)"



##### functions
#greeting function
greeting_fu ()
{
	clear
	echo Hello ${USER}, happy downloading !! 
	echo '    '
	sleep 1
	echo '    '
}
chk_yt_dlp_vars_fu () 
{
	if [ ! -d "/home/$USER/.yt-dlp_vars" ];
		then
			mkdir /home/$USER/yt-dlp_support/.yt-dlp_vars
	fi
}
#update function
update ()
{
	if [ "$daystore" != "$(date '+%Y.%m.%d')" ];
        then
                echo "yt-dlp UPDATE check !"
		sudo /usr/local/bin/yt-dlp -U
		chk_yt_dlp_vars_fu
		export day=$(date "+%Y.%m.%d")
        	echo $day > /home/$USER/yt-dlp_support/.yt-dlp_vars/day_store
	else
                echo "yt-dlp allready updated --> continue!"
fi
}
usage () 
{
	echo '    '
	echo 'usage [(mp3|fab|keep|qal|vid) ("url")]'
	echo '    '
	echo 'options see below.'
	echo '    '
       	echo 'mp3  -> download video and convert it to mp3'
	echo 'fab  -> download video from facbook.com'
	echo 'keep -> download video and convert it to mp3 and keep the video'
	echo 'qal  -> check available quality options and download with your choice'
	echo 'vid  -> download video'



}
#mp3 download function
mp3_fu () 
{
	/usr/local/bin/yt-dlp -f 'ba' -x --audio-format mp3 $arg2
}
#video download function
vid_fu () 
{
	/usr/local/bin/yt-dlp -ci -f b $arg2
}
#facebook-video download
fab_fu ()
{
	/usr/local/bin/yt-dlp -ci -f sd $arg2
}
# keep video and mp3
keep_fu () 
{
	/usr/local/bin/yt-dlp -f 'ba' -x --audio-format mp3 $arg2 
	/usr/local/bin/yt-dlp -ci -f b $arg2
}
#check available quality and use choosen one
quality_check_fu () 
{
	/usr/local/bin/yt-dlp -F $arg2
	echo '    '
	read -p "choose the ID, it is the first column:" user_var
	echo '    '
	/usr/local/bin/yt-dlp -ci -f $user_var $arg2
}



#call f1 function
f1call () 
{
	case $arg1  in 
		mp3) 
			update
    			mp3_fu
    			;;
    		vid) 
    			update
			vid_fu
    			;;
    		keep)
    			update
			keep_fu
    			;;
		fab)
			update
			fab_fu
			;;
		qal)	
			update
			quality_check_fu
			;;
		*)
    			usage 
			exit
    			;;
	esac    
}
##### scripting
#run function
greeting_fu
f1call
##### end
exit
