#!/bin/sh
#set -x
##### functions
#.bashrc entry exist, do
yes_fu () 
{
	echo '   '
        echo .bashrc entry already exists !!
	mkdir -p /home/$USER/.yt-dlp_vars/
        if [ ! -d /home/${USER}/yt-dlp_support/ ];
        then
		mkdir -p /home/${USER}/yt-dlp_support/
                echo /home/${USER}/yt-dlp_support/ created
                mkdir -p /home/$USER/yt-dlp_support/.yt-dlp_vars/
        fi
}

#.bashrc entry does not exist
no_fu () 
{
	echo '   '
	echo .bashrc entry will be made !!
	echo "#yt-dlp supporting alias" >> /home/${USER}/.bashrc
        echo alias yy=\'/home/${USER}/yt-dlp_support/yy.sh\' >> /home/$USER/.bashrc
	mkdir -p /home/$USER/.yt-dlp_vars/
        if [ ! -d /home/${USER}/yt-dlp_support/ ];
        	then
                	mkdir -p /home/${USER}/yt-dlp_support/
                	echo /home/${USER}/yt-dlp_support/ created
                	mkdir -p /home/$USER/yt-dlp_support/.yt-dlp_vars/
	fi
}
# prepare for using yy.sh  
prepare_fu ()
{
	export check_string=`alias yy='/home/${USER}/yt-dlp_support/yy.sh'`
	export check_file="/home/${USER}/.bashrc"
	if  grep -q "$check_string" "$check_file" ; 
	then
		yes_fu
	else
		no_fu
	fi
	mkdir -p /home/$USER/.yt-dlp_vars/
	if [ ! -d /home/${USER}/yt-dlp_support/ ]; 
	then
		mkdir -p /home/${USER}/yt-dlp_support/
		echo /home/${USER}/yt-dlp_support/ created
		mkdir -p /home/$USER/yt-dlp_support/.yt-dlp_vars/
	fi
}

# check if yt-dlp is at the rignt place or install it
# work_fu
work_fu () 
{
	check_yt=$(ls /usr/local/bin/ |grep yt-dlp);
	if [ "$check_yt" = "yt-dlp" ];
		then
       			 prepare_fu
		else
       			 sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
       			 sudo chmod a+rx /usr/local/bin/yt-dlp
      	 		 prepare_fu
	fi
}
#say what to do!
what_to_fu ()
{
	#clear
	echo '   '
	echo work is done !!!, please put yy.sh here: /home/${USER}/yt-dlp_support/ 
	echo '   '
	echo do --\> chmod +x /home/${USER}/yt-dlp_support/yy.sh
	echo '   '
	echo thank you $USER,........ happy downloading !!     :\)
	echo '   '
}
##### scripting
clear
work_fu
what_to_fu

