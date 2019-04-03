:: Name:     uploads-get
:: Purpose:  Download uploads folder trough scp
:: Author:   @allysonsouza
:: URL:      https://github.com/allysonsouza
:: Version:  0.0.1
:: License:  GPL-v2

@ECHO OFF
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

:: variables
SET server=insert here your hostname
SET user=insert here your username
SET remote_folder=set your server wordpress path here
SET local_folder=set your local folder to download

ECHO %CMDCMDLINE% | FINDSTR /L %COMSPEC% >NUL 2>&1
IF %ERRORLEVEL% == 0 SET interactive=1

:: ssh connect
scp -r %user%@%server%:%remote_folder% %local_folder%

IF "%interactive%"=="0" PAUSE
EXIT /B 0
