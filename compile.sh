#!/bin/sh

prog="GroPro.jar"
srcdir="./src"

readonly prog
readonly srcdir

if [ -d "$srcdir" ]; then
  find . -iname *.java > sources.txt
  javac @sources.txt -d ./bin
  jar -cvfe "$prog" Main ./bin
  rm sources.txt
  echo "Programm kompiliert."
else
  echo "-------------FEHLER-------------"
  echo "Pfad fuer Sourcecode-Dateien wurde nicht gefunden!"
  echo "Bitte ueberpruefen Sie ob der Pfad"
  echo "$srcdir"
  echo "existiert und fuehren Sie das Skript erneut aus."
fi
