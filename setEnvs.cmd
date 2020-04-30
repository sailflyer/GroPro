set GOTHAER_BASE=C:\Gothaer\dev\Programme
set M2_HOME=%GOTHAER_BASE%\apache-maven
set TOMCAT_HOME=%GOTHAER_BASE%\apache-tomcat
set GIT_HOME=%GOTHAER_BASE%\git
set JAVA_HOME=%GOTHAER_BASE%\openJDK1.8.0
set PATH=%JAVA_HOME%\bin;%M2_HOME%\bin;%GOTHAER_BASE%\bin;%GIT_HOME%\bin;%PATH%
set JBOSS_HOME=%GOTHAER_BASE%\jboss-eap-7.2
rem Weil das eclipse und auch gitbash lange und viel auf das Homedir zugreifen wird das HomeDir fuer diese Zwecke umgebogen!
if NOT exist "C:\Users\%USERNAME%\.gitconfig" (
    copy %HOMEDRIVE%%HOMEPATH%.gitconfig C:\Users\%USERNAME%\.gitconfig
)
if exist "%HOMEDRIVE%%HOMEPATH%.ssh\" (
    if not exist "C:\Users\%USERNAME%\.ssh\" (
	    xcopy "%HOMEDRIVE%%HOMEPATH%\.ssh\*" "C:\Users\%USERNAME%\.ssh\" /s
    )
)
set HOMEDRIVE=C:
set HOMEPATH=\Users\%USERNAME%\