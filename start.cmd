:: Skript zum ausfuehren der Dateien in vorgegebenen Ordner

@echo off

:: Standardwerte setzen
set prog = "GroPro.jar"
set dir  = "./Tests"
set typ  = ".txt"

:: Ueberpruefen ob Parameter gesetzt worden
  :: Ueberpruefen ob Parameter gesetzt wurden
  IF NOT ""=="%1" (
    IF NOT ""=="%2" (
      IF "%1%" equ "-d" GOTO DIRPATH
      IF "%1%" equ "-t" GOTO STARTTYP
      echo "---------------FEHLER---------------"
      echo "Unbekannter Parameter: " %1%
      echo "Erlaubte Parameter sind:"
      echo "-d <Pfad_zu_Ordner>      Zur Angabe eines Verzeichnisses, aus dem die Testfaelle ausgefuehrt werden sollen (Standard: ./Tests)"
      echo "-t <Dateiendung>         Zur Angabe einer Dateiendung, zur Einschränkung der auszuführenden Dateien im Testfallverzeichnis (Standard: .txt)"
      echo "Ausfuehrung wird beendet."
      echo "Zum beenden beliebige Taste druecken."
      pause > nul
    ) ELSE (
      echo "---------------FEHLER---------------"
      echo "Fehlendes Argument fuer den Parameter: " %1%
      echo "Bitte geben Sie bei der Angabe des Parameters -d zusätzlich einen Pfad an."
      echo "Bei der Verwendung des Parameters -t geben Sie bitte zusätzlich eine Dateiendung an."
      echo "Ausfuehrung wird beendet."
      echo "Zum beenden beliebige Taste druecken."
      pause > nul
    )
  )
  :PARAMCHECK
    IF NOT ""=="%3" (
      IF NOT "%3%" equ "%1%" (
        IF NOT ""=="%4" (
          IF "%3%" equ "-d" GOTO DIRPATH
          IF "%3%" equ "-t" GOTO STARTTYP
          echo "---------------FEHLER---------------"
          echo "Unbekannter Parameter: " %1%
          echo "Erlaubte Parameter sind:"
          echo "-d <Pfad_zu_Ordner>      Zur Angabe eines Verzeichnisses, aus dem die Testfaelle ausgefuehrt werden sollen (Standard: ./Tests)"
          echo "-t <Dateiendung>         Zur Angabe einer Dateiendung, zur Einschränkung der auszuführenden Dateien im Testfallverzeichnis (Standard: .txt)"
          echo "Ausfuehrung wird beendet."
          echo "Zum beenden beliebige Taste druecken."
          pause > nul
        ) ELSE (
          echo "---------------FEHLER---------------"
          echo "Fehlendes Argument fuer den Parameter: " %3%
          echo "Bitte geben Sie bei der Angabe des Parameters -d zusätzlich einen Pfad an."
          echo "Bei der Verwendung des Parameters -t geben Sie bitte zusätzlich eine Dateiendung an."
          echo "Ausfuehrung wird beendet."
          echo "Zum beenden beliebige Taste druecken."   
          pause > nul
        )
      ) ELSE (
        echo "---------------FEHLER---------------"
        echo "Parameter mehrfach verwendet!"
        echo "Jeder Parameter darf maximal einmal verwendet werden für einen Aufruf."
        echo "Bitte ueberpruefen Sie die ordnungsmaessige Anwendung der Parameter."
        echo "Ausfuehrung wird beendet."
        echo "Zum beenden beliebige Taste druecken."
        pause > nul
      )
    ) ELSE (
      GOTO AUSFUEHRUNG
    )

:DIRPATH
  IF "%1%" equ "-d" (
    set dir = %2%
    GOTO PARAMCHECK
  )
  
  IF "%3%" equ "-d" (
    set dir = %4%
    GOTO AUSFUEHRUNG
  )
  echo "Unbekannter Fehler - DIRPATH"

:STARTTYP
  IF "%1%" equ "-t" (
    set typ = %2%
    GOTO PARAMCHECK
  )
  
  IF "%3%" equ "-t" (
    set typ = %4%
    GOTO AUSFUEHRUNG
  )
  echo "Unbekannter Fehler - STARTTYP"

:AUSFUEHRUNG
  IF NOT EXISTS %dir% (
    echo "---------------FEHLER---------------"
    echo "Verzeichnis konnte nicht gefunden oder geoeffnet werden."
    echo "Bitte ueberpruefen Sie, dass das Verzeichnis vorhanden ist und Sie ueber die noetigen Berechtigungen verfuegen auf Dateien im Ordner aendernd zuzugreifen."
    echo "Ausfuehrung wird beendet."
    echo "Zum beenden beliebige Taste druecken."
    pause > nul
  )
  for %%i in (%dir%/*%typ%) do (
    echo "Verarbeite Datei " %%i
    java -jar %prog% %%i
    echo.
  )
  echo.
  echo "Alle Dateien verarbeitet."
  echo "Zum beenden beliebige Taste druecken."
  pause > nul