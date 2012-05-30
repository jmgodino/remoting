package es.gob.catastro.service.ping;

public class PingServiceException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public PingServiceException() {

	}

	public PingServiceException(String message) {
		super(message);
	}

	public PingServiceException(Throwable cause) {
		super(cause);
	}

	public PingServiceException(String message, Throwable cause) {
		super(message, cause);
	}

}
