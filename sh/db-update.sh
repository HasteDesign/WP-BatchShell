#!/bin/bash

##################################################################
# Name:     db-get
# Purpose:  Connect to server trough ssh, export database and download it to sync with development.
# Author:   @allysonsouza
# URL:      https://github.com/allysonsouza
# Version:  0.0.1
# License:  GPL-v2
##################################################################

# variables
today='date +%Y-%m-%d'
server="myhostname.com"
user="myusername"
old_url="oldurl.com"
new_url="newurl.com"
remote_path="/my/wordpress/path/on/server"
local_path="./"
filename="db.sql"
port=22

# commands
go_to_folder="cd $remote_path"
export_backup="wp db export backup.$today.sql"
import_database="wp db import $filename"
search_replace="wp search-replace $old_url $new_url"
search_replace_https="wp search-replace https http"
# $change_user_password=wp user update UserName --user_pass=1234

# upload database
echo "[db-update] > Sending $filename database to remote server..."
rsync -avzh -e "ssh -p $port" "$local_path/$filename" $user@$server:"$remote_path"
# import database
echo "[db-update] > Importing $filename in remote server..."
ssh $user@$server "$go_to_folder && $export_backup && $import_database && $search_replace"
# download backup database
echo "[db-update] > Downloading backup-$today.sql backup..."
rsync -avzh -e "ssh -p $port" $user@$server:"$remote_path/backup-$today.sql" "$local_path"
# scp $user@$server:$path/db.sql db.sql
