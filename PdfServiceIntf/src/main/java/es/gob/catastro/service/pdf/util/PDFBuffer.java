package es.gob.catastro.service.pdf.util;

import java.io.Serializable;

public class PDFBuffer implements Serializable {

	private static final long serialVersionUID = -7160683012218696523L;
	
	public PDFBuffer() {
		super();
	}
	
	public PDFBuffer(byte[] content) {
		super();
		this.content = content;
	}

	byte[] content;

	public byte[] getContent() {
		return content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}
	
	
	
}
