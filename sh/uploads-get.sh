#!/bin/bash

##################################################################
# Name:     uploads-get
# Purpose:  Download uploads folder trough rsync
# Author:   @allysonsouza
# URL:      https://github.com/allysonsouza
# Version:  0.0.1
# License:  GPL-v2
##################################################################

# variables
server="myhostname.com"
user="myusername"
remote_folder="/my/wordpress/path/on/server"
local_folder="./"
port=22

# ssh connect
rsync -avzh -e "ssh -p $port" $user@$server:"$remote_folder" "$local_folder" --ignore-existing --progress
