#Skript zum compilieren

#Standardwerte
$prog="GroPro.jar"
$srcdir=".\src"


#Ueberprueft ob Ordner mit Testfaellen vorhanden ist
if(Test-Path "$srcdir")
{
    & dir /s /B "*.java" > sources.txt
    & javac "@sources.txt" -d .\bin
    & jar -cvfe $prog Main .\bin
    & del sources.txt
    echo("Programm compiliert")
}
else
{
    echo "-------------Test-Fehler-------------"
    echo "Pfad fuer Sourcecode-Dateien wurde nicht gefunden!"
    echo "Bitte ueberpruefen Sie ob der Pfad"
    echo $srcdir
    echo "existiert und fuehren das Skript erneut aus."
}