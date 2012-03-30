package es.gob.catastro.service.rmi.pdf.client;

import java.rmi.RemoteException;

import es.gob.catastro.service.pdf.PDFService;
import es.gob.catastro.service.pdf.util.PDFBuffer;

import es.gob.catastro.service.rmi.client.RmiClientException;
import es.gob.catastro.service.rmi.client.RmiOracleClient;

public class PDFClient extends RmiOracleClient<PDFService> implements PDFService {

	@Override
	public PDFBuffer generarPDF(String xml, String trans) throws RemoteException {

		for (int i = 0; i < getRetries(); i++) {
			try {

				PDFService service = getService("PdfService");
				return service.generarPDF(xml, trans);

			} catch (Exception e) {
				debug("Error invocando al servicio", e);
			}
		}

		throw new RmiClientException("No se ha podido invocar al servicio remoto");

	}

}