#!/bin/sh

outdir="./Output"
filetyp_standard=".out"
filetyp_error=".err"

#Variablen readonly machen
readonly outdir
readonly filetyp_standard
readonly filetyp_error

#Ueberpruefen ob Ordner mit Ausgaben vorhanden ist
if [ -d "$outdir" ]; then
  for file in "$outdir"/*"$filetyp_standard" "$outdir"/*"$filetyp_error"
  do
    echo "Loesche der Datei " "$file"
    rm "$file"
  done
  echo "Alle Dateien geloescht"
else
  echo "-------------FEHLER-------------"
  echo "Pfad fuer die Ausgabedateien wurde nicht gefunden!"
  echo "Bitte ueberpruefen Sie ob der Pfad"
  echo "$outdir"
  echo "existiert und fuehren das Skript erneut aus."
fi
 
