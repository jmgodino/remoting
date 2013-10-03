package es.gob.catastro.service.rmi.pdf.server;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

import es.gob.catastro.service.pdf.PDFService;
import es.gob.catastro.service.pdf.PDFServiceException;
import es.gob.catastro.service.pdf.util.PDFBuffer;

import es.gob.catastro.service.rmi.pdf.server.translet.TransletProcessor;


public class PDFPlugin implements PDFService {

	private static final Logger log = LoggerFactory.getLogger(PDFPlugin.class);

	public PDFPlugin() {
		super();
	}

	@Override
	public PDFBuffer generarPDF(PDFBuffer xml, String transformer) {
		try {
			TransletProcessor trans = new TransletProcessor(transformer);
        	byte[] pdfContent = trans.transform(xml);
        	return new PDFBuffer(pdfContent);
        } catch (Exception e) {
        	log.error("Error en la generacion del PDF", e);
			throw new PDFServiceException("Error en el plugin de PDF-FOP", e);
		}
	}


}
