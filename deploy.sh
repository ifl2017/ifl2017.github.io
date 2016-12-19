#!/bin/bash

# Shell script to deploy the ifl 2016 site to the webserver.
# Make sure you have SSH access to departemental servers, and are a member of
# of dtaig group.
#
# DO NOT RUN THIS SCRIPT IN ANY OTHER DIRECTORY BUT THE ifl2016-website
# directory.
#
# Author: Alexander Vandenbroucke <alexander.vandenbroucke@kuleuven.be>

# static configuration settings
REMOTE=ssh.cs.kuleuven.be
REMOTE_DIR=/cw/vwww1/dtai_static/public_html/static/events/ifl2016/
LOCAL_DIR=./




if [ `pwd | xargs basename` = "ifl2016-website" ]
then
    BRANCH=`git branch | grep "master"`
    if [ "$BRANCH"="* master" ]
    then

	echo -n "Please enter your username: "
	read user
	echo "Deploying as $user..."

       echo [local] from $LOCAL_DIR
       echo [$REMOTE] to $REMOTE_DIR

       rsync -rav --chmod="a+r,g+w" --exclude "*~" --exclude "*.sh" $LOCAL_DIR/* $user@$REMOTE:$REMOTE_DIR

       if [ $? -eq 0 ]
       then
	   echo Done.
       fi
    else
	echo "ERROR: Please deploy only from the master branch!"
    fi
else
    echo "ERROR: This script must be run from the ifl2016-website directory!"
fi

