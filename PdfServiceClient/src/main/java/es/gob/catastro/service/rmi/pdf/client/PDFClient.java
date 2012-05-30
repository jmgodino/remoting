package es.gob.catastro.service.rmi.pdf.client;

import java.rmi.RemoteException;

import es.gob.catastro.service.pdf.PDFService;
import es.gob.catastro.service.pdf.PDFServiceException;
import es.gob.catastro.service.pdf.util.PDFBuffer;
import es.gob.catastro.service.rmi.client.RmiOracleClient;

public class PDFClient extends RmiOracleClient<PDFService> implements PDFService {

	
	public PDFBuffer generarPDF(String xml, String trans) {
		PDFService service = getService("PdfService");
		try {
			return service.generarPDF(xml, trans);
		} catch (RemoteException e) {
			throw new PDFServiceException(e);
		}
	}
	
	public static byte[] generarPdf(String xmlIn, String nombreTransformador){
		return getInstance().generarPDF(xmlIn, nombreTransformador).getContent();
	}
	
	private static PDFClient getInstance() {
		return new PDFClient();
	}

}