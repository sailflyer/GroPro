#!/bin/sh

prog="GroPro.jar"
srcdir="./src"

readonly prog
readonly srcdir

if [ -d "$srcdir" ]; then
  #find . -iname *.java > sources.txt
  #javac @sources.txt -d ./bin
  #jar -cvfe "$prog" Main ./bin
  #rm sources.txt

  mvn clean install assembly:single

  cd target
  mv gropro-1.0-SNAPSHOT-jar-with-dependencies.jar ./../GroPro.jar
  cd ..
  rm -r target

  echo "Programm kompiliert."
else
  echo "-------------FEHLER-------------"
  echo "Pfad fuer Sourcecode-Dateien wurde nicht gefunden!"
  echo "Bitte ueberpruefen Sie ob der Pfad"
  echo "$srcdir"
  echo "existiert und fuehren Sie das Skript erneut aus."
fi
