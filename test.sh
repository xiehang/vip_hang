#!/bin/bash

MOTIONCONF=/etc/motion/motion.conf  # position where the conf file is 

#MOTIONDIR='sudo grep "^target_dir" $MOTIONCONF | awk '{print $2}'' # this line works in the terminal, but failed here, no idea why, i do that so that the user can change the target file, with changing the conf file. As this fail, i will just assign the default value to it....... so sad.... 

MOTIONDIR=/tmp/motion  # never have space after the "=" -O-   

if [ ! -d $MOTIONDIR ]; then    #CHECK if the target dir is over there, else creat one
	mkdir $MOTIONDIR
	chown motion $MOTIONDIR  # make sure that the ownership belongs to the usr
fi

LISTFILES=$(find $MOTIONDIR -maxdepth 1 -type f | grep jpg$) # do not going to any sub dir, find all jpg file.
NUMFILES='find $MOTIONDIR -maxdepth 1 -type f | grep jpg$ | wc -l' # find how many of file are there in the target file
#echo "$NUMFILES"
if [ "$NUMFILES -gt 0" ]; then
	for IMAGEFILE in "$LISTFILES"
	do
             # version 1, send e-mail without an attatchment
		 echo -e "send the email, someone comeing!!!" \
		 | sudo mutt -s "test with bash file hang!!!!" xiehang3358@gmail.com \
		 | sudo rm "$IMAGEFILE"
		 #| echo "$IMAGEFILE" #| echo "\n" #| sudo rm "$IMAGEFILE"

	# version 2, try to send e-mail with the attatchment
	#	echo -e "termianl for test" \
	#	| mutt -s "test from hang" \
	#	-F /root/.muttrc \
	#	-a $IMAGEFILE -- xiehang3358@gmail.com
	#	rm $IMAGEFILE

	
	done
fi 













