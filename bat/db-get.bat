:: Name:     db-get
:: Purpose:  Connect to server trough ssh, export database and download it to sync with development environment.
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
SET export_database=wp db export db.sql
SET import_local_database=wp db import db.sql
SET search_replace=wp search-replace %old_url% %new_url%
SET search_replace_https=wp search-replace https http
::SET change_user_password=wp user update UserName --user_pass=1234

ECHO %CMDCMDLINE% | FINDSTR /L %COMSPEC% >NUL 2>&1
IF %ERRORLEVEL% == 0 SET interactive=1

:: ssh connect
ssh %user%@%server% "%go_to_folder% && %export_database%"
scp %user%@%server%:%path%/db.sql db.sql

:: local commands
%import_local_database% && %search_replace% && %search_replace_https%

IF "%interactive%"=="0" PAUSE
EXIT /B 0
