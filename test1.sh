#! /bin/bash

# Auther: hang
# Version : 3.0
# Date : 2013/10/7 1:00 pm


MOTIONCONF=/etc/motion/motion.conf   # this is to configure where the conf file is
MOTIONDIR=$( sudo grep "^target_dir" $MOTIONCONF | awk '{ print $2}' )   # in fact it should be /tmp/motion , this set up is for changes only in the conf, not the whole preoject,

# just for test if the dir is correct
#echo "$MOTIONDIR"

# test if the motion dir does exist, if no then, i will creat one!, it should be there though

if [ ! -d $MOTIONDIR ]; then
	mkdir $MOTIONDIR
	chown motion $MOTIONDIR
fi

LISTFILES=$( find $MOTIONDIR -maxdepth 1 -type f | grep jpg$)   # list all the jpg file in the motion dir, which needed to be send though e-mail
#echo "$LISTFILES" 
#  only for debug test if the file is correct 

NUMFILES=$( find $MOTIONDIR -maxdepth 1 -type f | grep jpg$ | wc -l)
echo "$NUMFILES"

if [ $NUMFILES -gt 0 ]; then
	for IMAGEFILE in $LISTFILES
	do
		sudo echo -e "hang xie, you are in tttt!!!!!" | mutt -s "alert" -a $IMAGEFILE -- xiehang3358@gmail.com 
		sudo rm  $IMAGEFILE
	done
fi




