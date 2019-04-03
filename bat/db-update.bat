:: Name:     db-update
:: Purpose:  Connect to server trough ssh and run wp-cli commands
:: Author:   @allysonsouza
:: URL:      https://github.com/allysonsouza
:: Version:  0.0.1
:: License:  GPL-v2

@ECHO OFF
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

:: variables
SET server=insert here your hostname
SET user=insert here your username
SET old_url=oldurl.com
SET new_url=newurl.com
SET path=set your server wordpress path here

:: commands
SET go_to_folder=cd %path%
SET import_database=wp db import db.sql
SET import_local_database=wp db import db.sql
SET search_replace=wp search-replace %old_url% %new_url%
SET search_replace_https=wp search-replace https http
SET flush_rewrite=wp rewrite flush

ECHO %CMDCMDLINE% | FINDSTR /L %COMSPEC% >NUL 2>&1
IF %ERRORLEVEL% == 0 SET interactive=1

:: ssh connect
ssh %user%@%server% "%go_to_folder% && %import_database% && %search_replace% && %search_replace_https% && %flush_rewrite%"

IF "%interactive%"=="0" PAUSE
EXIT /B 0
