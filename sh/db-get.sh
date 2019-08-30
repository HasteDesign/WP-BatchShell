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
server="myhostname.com"
user="myusername"
old_url="oldurl.com"
new_url="newurl.com"
path="/my/wordpress/path/on/server"

# commands
go_to_folder="cd $path"
export_database="wp db export db.sql"
import_local_database="wp db import db.sql"
search_replace="wp search-replace $old_url $new_url"
search_replace_https="wp search-replace https http"
# $change_user_password=wp user update UserName --user_pass=1234

# ssh connect
ssh $user@$server "$go_to_folder && $export_database"
# scp $user@$server:$path/db.sql db.sql
rsync -avzh $user@$server:"$path/db.sql" db.sql

# local commands
$import_local_database && $search_replace && $search_replace_https # && $change_user_password
