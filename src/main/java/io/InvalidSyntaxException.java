package io;

/**
 * {@code InvalidSyntaxException} ist eine dedizierte Exception, welche genutzt werden soll,
 * wenn es zu syntaktischen Fehlern in der Eingabe kommt.
 * 
 * @author Lukas Dahlberg
 * @version 1.0
 */
public class InvalidSyntaxException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	
	public InvalidSyntaxException(String msg) {
		super(msg);
	}
	
}
