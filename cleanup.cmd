:: Skript zum leeren des Ausgabeordners
@echo off

:: Setzen der Standardwerte
set outdir="./Output"

:: Ueberpruefen ob Ordner vorhanden ist
IF NOT EXIST %outdir% (
  echo "-------------Test-Fehler-------------"
  echo "Pfad fuer die Ausgabedateien wurde nicht gefunden!"
  echo "Bitte ueberpruefen Sie ob der Pfad"
  echo "%outdir%"
  echo "existiert und fuehren das Skript erneut aus."
  echo "Zum beenden beliebige Taste druecken."
  pause > nul
) 
for %%i in ("%outdir%/*.out") do (
  echo "Loesche Datei " %%i
  del %%i
)
echo "Ausgabeordner wurde geleert von allen Files mit der Dateiendung .out"
echo "Zum beenden beliebige Taste druecken."
pause > nul