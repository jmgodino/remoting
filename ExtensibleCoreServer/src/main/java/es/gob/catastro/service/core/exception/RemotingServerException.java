package es.gob.catastro.service.core.exception;

public class RemotingServerException extends RuntimeException {

	private static final long serialVersionUID = 9063630066649172598L;

	public RemotingServerException() {
	}

	public RemotingServerException(String msg) {
		super(msg);
	}

	public RemotingServerException(Throwable t) {
		super(t);
	}

	public RemotingServerException(String msg, Throwable t) {
		super(msg, t);
	}

}
