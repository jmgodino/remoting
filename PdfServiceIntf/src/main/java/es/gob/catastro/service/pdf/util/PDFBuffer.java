package es.gob.catastro.service.pdf.util;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.Serializable;

import es.gob.catastro.service.pdf.PDFServiceException;

public class PDFBuffer implements Serializable {

	private static final long serialVersionUID = -7160683012218696523L;

	private byte[] content;
	private int longitud;

	public PDFBuffer() {
		super();
	}

	public PDFBuffer(InputStream paramDatos, int lon)
			throws PDFServiceException {
		if (paramDatos == null) {
			throw new PDFServiceException(
					"Error inicializando buffer. El stream de entrada es nulo");
		}
		try {
			this.content = new byte[lon];
			paramDatos.read(this.content);
			this.longitud = lon;
		} catch (Throwable t) {
			System.out.println("Error - inicio: " + 0 + " fin: " + lon
					+ " -> " + t.toString());
			throw new PDFServiceException(t.getMessage());
		}
	}

	public PDFBuffer(byte[] content) {
		super();
		this.content = content;
		this.longitud = content.length;
	}

	public byte[] getContent() {
		return content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	public int getLongitud() {
		return this.longitud;
	}
	
	public InputStream getInputStream() {
		return new ByteArrayInputStream(content, 0, longitud);
	}

}
