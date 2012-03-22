package es.gob.catastro.service.rmi.client;

public class RmiClientException extends RuntimeException {

	private static final long serialVersionUID = 1299806582351579592L;

	public RmiClientException() {
		super();
	}

	public RmiClientException(String str, Throwable t) {
		super(str, t);
	}

	public RmiClientException(String str) {
		super(str);
	}

	public RmiClientException(Throwable t) {
		super(t);
	}

}
