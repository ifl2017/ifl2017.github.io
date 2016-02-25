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
REMOTE=clarke.cs.kuleuven.be
REMOTE_DIR=/cw/vwww1/dtai_static/public_html/static/events/ifl2016/
LOCAL_DIR=./


echo -n "Please enter your username: "
read user
echo "Deploying as $user..."

if [ `pwd | xargs basename` = "ifl2016-website" ]
   then
       echo [local] from $LOCAL_DIR
       echo [$REMOTE] to $REMOTE_DIR

       rsync -rav --chmod="g+w" $LOCAL_DIR/* $user@$REMOTE:$REMOTE_DIR

       if [ $? -eq 0 ]
          then
	      echo Done.
       fi
   else
       echo "This script must be run from the ifl2016-website directory!"
fi
