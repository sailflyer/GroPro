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
dir /s /B *.java > sources.txt
javac @sources.txt -d ./bin
jar -cvfe %prog% Main ./bin
del sources.txt
echo "Programm kompiliert"
GOTO SUCCESSFULL

:ERRORSECTION
    echo "-------------FEHLER-------------"
    echo "Pfad fuer Sourcecode-Dateien wurde nicht gefunden!"
    echo "Bitte ueberpruefen Sie ob der Pfad"
    echo %srcdir%
    echo "existiert und fuehren das Skript erneut aus."

:SUCCESSFULL