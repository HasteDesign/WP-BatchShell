#!/bin/bash

##################################################################
# Name:     uploads-get
# Purpose:  Download uploads folder trough scp
# Author:   @allysonsouza
# URL:      https://github.com/allysonsouza
# Version:  0.0.1
# License:  GPL-v2
##################################################################

# variables
server="insert here your hostname"
user="insert here your username"
remote_folder="set your server wordpress path here"
local_folder="set your local folder to download"

# ssh connect
rsync -avzh $user@$server:$remote_folder $local_folder --ignore-existing --progress
