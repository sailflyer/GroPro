package io;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

/**
 * Die Klasse {@code DateiAusgabe} dient dem ausgeben der Antwort in Form einer Datei.
 * Der Name der Ausgabedatei setzt sich zusammen aus dem Namen der Eingabedatei
 * und einer Dateiendung, welche bestimmt ist durch die schreibende Methode {@link FileOutput#writeOutput(String)}
 * bzw. {@link FileOutput#writeError(String, String, int)}
 * 
 * Die Ausgabedatei wird immer in das {@value #PATH} Verzeichnis geschrieben.
 * 
 * @author Lukas Dahlberg
 * @version 1.0
 */
public class FileOutput implements IOutput {

	private static final String PATH = "./Output/";
	private static final String INOUTLINE = "********************************************************************************";
	private static final String BEGINENDLINE = "*****";
	private String filename;
	
	public FileOutput(String filename) {
		setFilename(filename);
	}
	
	public void setFilename(String filename) {
		if(filename == null || filename.trim().length() == 0) {
			throw new IllegalArgumentException("Kein Dateiname uebergeben worden.");
		}
		this.filename = filename;
	}
	
	public String getFilename() {
		return filename;
	}
	
	/**
	 * @see IOutput#writeError(String, String, int)
	 * 
	 * @throws RuntimeException Wenn die Ausgabedatei nicht geschrieben werden kann.
	 */
	@Override
	public void writeError(String errorMessage, int row) {
		if(errorMessage == null || errorMessage.trim().length() == 0) {
			throw new IllegalArgumentException("Keine Fehlermeldung vorhanden!");
		}
		
		try(PrintWriter printer = new PrintWriter(new File(PATH + filename + ".err"))){
			String leerzeichenDatei = "";
			
			for(int i = 0; i < (filename.length() + 11) / 2; ++i) {
				leerzeichenDatei += " ";
			}
			
			printer.println(INOUTLINE 
					+ "\n*************************************FEHLER*************************************"
					+ INOUTLINE);
			printer.println(BEGINENDLINE 
					+ "                              Zeile: " 
					+ String.format("%03d", row) 
					+ "                              " 
					+ BEGINENDLINE);
			printer.println(BEGINENDLINE
					+ leerzeichenDatei + "Dateiname: " + filename + leerzeichenDatei
					+ BEGINENDLINE);
			printer.println(errorMessage);
			printer.println(INOUTLINE + "\n" + INOUTLINE + "\n" + INOUTLINE);
			
			printer.flush();
		} catch (FileNotFoundException e) {
			throw new RuntimeException("Fehler beim schreiben der Fehlerdatei");
		}
		
	}
	
	/**
	 * @see IOutput#writeOutput(String)
	 * 
	 * @throws RuntimeException Wenn die Ausgabedatei nicht geschrieben werden kann.
	 */
	@Override
	public void writeOutput() {
		//TODO implement Ausgabe
		try(PrintWriter printer = new PrintWriter(new File(PATH + filename + ".out"))){
			printer.flush();
		} catch (FileNotFoundException e) {
			throw new RuntimeException("Fehler beim schreiben der Ausgabedatei");
		}
	}
	
}
