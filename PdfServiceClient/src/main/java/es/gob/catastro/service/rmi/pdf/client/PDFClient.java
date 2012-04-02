package es.gob.catastro.service.rmi.pdf.client;

import java.rmi.RemoteException;

import es.gob.catastro.service.pdf.PDFService;
import es.gob.catastro.service.pdf.util.PDFBuffer;
import es.gob.catastro.service.rmi.client.RmiOracleClient;

public class PDFClient extends RmiOracleClient<PDFService> implements PDFService {

	@Override
	public PDFBuffer generarPDF(String xml, String trans) throws RemoteException {
		PDFService service = getService("PdfService");
		return service.generarPDF(xml, trans);
	}

}