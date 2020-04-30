#!/bin/sh

prog="GroPro.jar"
dir="./Tests"
typ=".txt"

readonly prog

if [ "$2" == "" ]
  then
    if [ "$1" != "" ]
      then
        echo "---------------FEHLER---------------"
        echo "Fehlendes Argument fuer den Parameter: $1"
        echo "Bitte geben Sie bei der Angabe des Parameters -d zusaetzlich einen Pfad an."
        echo "Bei der Verwendung des Parameters -t geben Sie bitte zusaetzlich eine Dateiendung an."
        echo "Ausfuehrung wird beendet."
        exit
    fi
  else
    if [ "$1" == "-d" ] || [ "$1" == "-dir" ]
      then
        dir=$2
        readonly dir
    elif [ "$1" == "-t" ] || [ "$1" == "-typ" ]
      then
        typ=$2
        readonly typ
    else
      echo "---------------FEHLER---------------"
      echo "Unbekannter Parameter: $1"
      echo "Erlaubte Parameter sind:"
      echo "-d <Pfad_zu_Ordner>      Zur Angabe eines Verzeichnisses, aus dem die Testfaelle ausgefuehrt werden sollen (Standard: ./Tests)"
      echo "-dir <Pfad zu Ordner>    Zur Angabe eines Verzeichnisses, aus dem die Testfaelle ausgefuehrt werden sollen (Standard: ./Tests)"
      echo "-t <Dateiendung>         Zur Angabe einer Dateiendung, zur Einschraenkung der auszufuehrenden Dateien im Testfallverzeichnis (Standard: .txt)"
      echo "-typ <Dateiendung>       Zur Angabe einer Dateiendung, zur Einschraenkung der auszufuehrenden Dateien im Testfallverzeichnis (Standard: .txt)"
      echo "Ausfuehrung wird beendet."
      exit
    fi
fi
if [ "$4" == "" ]
  then
    if [ "$3" != "" ]
      then
        echo "---------------FEHLER---------------"
        echo "Fehlendes Argument fuer den Parameter: $3"
        echo "Bitte geben Sie bei der Angabe des Parameters -d zusaetzlich einen Pfad an."
        echo "Bei der Verwendung des Parameters -t geben Sie bitte zusaetzlich eine Dateiendung an."
        echo "Ausfuehrung wird beendet."
        exit
    fi
  else
    if [ "$3" == "-d" ] || [ "$3" == "-dir" ] && [ "$3" != "$1" ]
      then
        dir="$4"
        readonly dir
    elif [ "$3" == "-t" ] || [ "$3" == "-typ" ] && [ "$3" != "$1" ]
      then
        typ="$4"
        readonly typ
    else
      echo "---------------FEHLER---------------"
      echo "Parameter unbekannt oder mehrfach verwendet: $3"
      echo "Erlaubte Parameter sind:"
      echo "-d || -dir <Pfad_zu_Ordner>      Zur Angabe eines Verzeichnisses, aus dem die Testfaelle ausgefuehrt werden sollen (Standard: ./Tests)"
      echo "-t || -typ <Dateiendung>         Zur Angabe einer Dateiendung, zur Einschraenkung der auszufuehrenden Dateien im Testfallverzeichnis (Standard: .txt)"
      echo "Bitte verwenden Sie die zwei verschiedenen Parameter oder nutzen einen gueltigen."
      echo "Ausfuehrung wird beendet."
      exit
    fi
fi

if [ -d "$dir" ]
  then
    for file in "$dir"/*"$typ"
    do
      echo "Fuehre Programm aus fuer die Datei: $file"
      java -jar "$prog" "$file"
    done
fi