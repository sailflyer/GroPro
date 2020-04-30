package io;

/**
 * Die Klasse {@code DateiEingabe} dient dem Einlesen der Eingabedatei.
 * Hier wird auf syntaktische Fehler geprueft, welche gemaess Konzept behandelt werden.
 * 
 * @author Lukas Dahlberg
 * @version 1.0
 */
public class FileInput implements IInput {
	
	private String comment;
	private String filename;
	private String path;
	
	public FileInput(String file) {
		// TODO implement
	}

	@Override
	public Object readData() {
		return null;
	}
	
	private void setComment(String comment) {
		if(comment == null || comment.trim().length() == 0) {
			return; // TODO throw Exception
		}
		this.comment = comment;
	}
	
	public String getComment() {
		return comment;
	}
	
	private void setFilename(String filename) {
		if(filename == null || filename.trim().length() == 0) {
			return; // TODO throw Exception
		}
		this.filename = filename;
	}
	
	public String getFilename() {
		return filename;
	}
	
	private void setPath(String path) {
		if(path == null || path.trim().length() == 0) {
			return; // TODO throw Exception
		}
		this.path = path;
	}
	
	public String getPath() {
		return path;
	}
	
}
