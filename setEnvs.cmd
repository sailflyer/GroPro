::set M2_HOME=path\to\apache-maven
::set JAVA_HOME=path\to\openJDK1.8.0

set GOTHAER_BASE=C:\Gothaer\dev\Programme
set M2_HOME=%GOTHAER_BASE%\apache-maven
set TOMCAT_HOME=%GOTHAER_BASE%\apache-tomcat
set GIT_HOME=%GOTHAER_BASE%\git
set JAVA_HOME=%GOTHAER_BASE%\openJDK1.8.0


:: Setzen der PATH-Variablen auf Basis der Pfade zu Maven und dem JDK
set PATH=%JAVA_HOME%\bin;%M2_HOME%\bin;%PATH%