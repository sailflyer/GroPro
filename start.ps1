#Skript zum ausfuehren aller Testfaelle

#Standardwerte setzen
$prog = "GroPro.jar"
$dir  = "./Tests"
$typ  = ".txt"

#Ueberpruefen gesetzter Parameter
for($i=0; $i -lt $args.count; $i++)
{
    $a = ([string] $args[$i]).split("=")
    #Abfragen ob ein neues Verzeichnis für die Testfaelle angegeben ist
    if($a[0].ToUpper() -eq "DIR")
    {
        $dir=$a[1]
    }
    #Abfrage ob Testfaelle einem neuen Dateityp entsprechen
    elseif($a[0].ToUpper() -eq "TYP")
    {
        $typ=$a[1]
    }
    else
    {
        echo "---------------FEHLER---------------"
        echo "Unbekannter Parameter:" $a[0].ToUpper()
        echo "Bitte ueberpruefen Sie die richtige Schreibweise des Parameters."
        echo "Erlaube Parameter sind:"
        echo "DIR - Angabe eines Verzeichnisses in welchem Eingabedateien liegen (Standardwert: ./Tests)"
        echo "TYP - Angabe der Dateiendung der Eingabedateien (Standardwert: .txt)"
        echo "Ausfuehrung wird beendet."
        exit
    }
}

#Ueberprueft ob Programm vorhanden ist
if(Test-Path "./$prog")
{
    #Ueberprueft ob Ordner mit Testfaellen vorhanden ist
    if(Test-Path "$dir")
    {
        #Nimmt alle Dokumente mit gewuenschter Endung aus dem Ordner fuer Testfaelle
        $files = Get-ChildItem $dir | Where { $_.Extension -eq $typ }
        foreach($file in $files)
        {
            if($file)
            {
                echo("-->" + ($file.FullName) + "<--")
                & .\$prog $file.FullName
            }
            else
            {
                echo "-------------WARNUNG-------------"
                echo "Ordner fuer Testfeaelle ist leer!"
                echo "Bitte ueberpruefen Sie ob der Ordner"
                echo "$dir"
                echo "Testfaelle enthaelt und fuehren das Skript erneut aus."
                exit
            }
        }
		echo("Alle Dateien ausgefuehrt.")
    }
    else
    {
        echo "-------------FEHLER-------------"
        echo "Pfad fuer Testfeaelle nicht gefunden!"
        echo "Bitte ueberpruefen Sie ob der Pfad"
        echo "$dir"
        echo "existiert und fuehren das Skript erneut aus."
    }
}
else
{
echo "---------------FEHLER---------------"
echo "Datei GroPro.jar wurde nicht gefunden!"
echo "Bitte ueberpruefen Sie ob das Skript"
echo "im selben Verzeichnis ist wie die Datei GroPro.jar"
echo "oder kompilieren Sie das Programm erneut."
}