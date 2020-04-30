:: Skript zum kompilieren
@echo off

:: Environment-Variablen setzen
CALL ./setEnvs.cmd

:: Standardwerte in lokalen Variablen setzen
set prog="GroPro.jar"
set srcdir="./src"

:: Ueberpruefen ob Ordner vorhanden ist und Dateien kompilieren
if not exist %srcdir% (
  GOTO ERRORSECTION 
)
REM dir /s /B *.java > sources.txt
REM javac @sources.txt -d ./bin
REM jar -cvfe %prog% Main ./bin
REM del sources.txt

mvn clean install assembly:single
cd target
echo Verschiebe Jar-File
move gropro-1.0-SNAPSHOT-jar-with-dependencies.jar ./../GroPro.jar
cd ..

echo Loesche sonstige Dateien
for %%f in ("./target/*") do ( del %%f )
rmdir target

echo "Programm kompiliert"
GOTO SUCCESSFULL

:ERRORSECTION
    echo "-------------FEHLER-------------"
    echo "Pfad fuer Sourcecode-Dateien wurde nicht gefunden!"
    echo "Bitte ueberpruefen Sie ob der Pfad"
    echo %srcdir%
    echo "existiert und fuehren das Skript erneut aus."

:SUCCESSFULL