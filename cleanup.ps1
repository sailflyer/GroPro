$outdir="./Output"
$filetyp=".out"

#Ueberprueft ob Ordner mit Ausgaben vorhanden ist
    if(Test-Path "$outdir")
    {
        #Nimmt alle Dokumente mit gewuenschter Endung aus dem Ordner fuer die Ausgabe
        $files = Get-ChildItem $outdir | Where { $_.Extension -eq $filetyp }
        foreach($file in $files)
        {
            if($file)
            {
                echo("Loesche: " + ($file.FullName))
                rm $file.FullName
            }
            else
            {
                echo "-------------WARNUNG-------------"
                echo "Ordner fuer die Ausgabedateien ist leer!"
                echo "Bitte ueberpruefen Sie ob der Ordner"
                echo "$outdir"
                echo "Ausgabedateien enthaelt und fuehren das Skript erneut aus."
                echo "Die Ausgabedateien enden alle auf .out !"
            }
        }
		echo("Alle Dateien geloescht")
    }
    else
    {
        echo "-------------FEHLER-------------"
        echo "Pfad fuer die Ausgabedateien wurde nicht gefunden!"
        echo "Bitte ueberpruefen Sie ob der Pfad"
        echo "$outdir"
        echo "existiert und fuehren das Skript erneut aus."
    }