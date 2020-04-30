package io;

/**
 * {@code InvalidInputException} ist eine dedizierte Exception, welche genutzt werden soll,
 * wenn es zu syntaktischen Fehlern in der Eingabe kommt.
 * 
 * @author Lukas Dahlberg
 * @version 1.0
 */
public class InvalidInputException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	
	public InvalidInputException(String msg) {
		super(msg);
	}
	
}
