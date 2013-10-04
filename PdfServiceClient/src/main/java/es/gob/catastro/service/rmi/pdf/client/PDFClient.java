package es.gob.catastro.service.rmi.pdf.client;

import java.io.OutputStream;
import java.rmi.RemoteException;

import oracle.sql.BLOB;
import oracle.sql.CLOB;
import es.gob.catastro.service.pdf.PDFService;
import es.gob.catastro.service.pdf.PDFServiceException;
import es.gob.catastro.service.pdf.util.PDFBuffer;
import es.gob.catastro.service.rmi.client.RmiOracleClient;

public class PDFClient extends RmiOracleClient<PDFService>
		implements
			PDFService {

	public PDFBuffer generarPDF(PDFBuffer xml, String trans) {
		try {
			PDFService service = getService("PdfService");
			return service.generarPDF(xml, trans);
		} catch (RemoteException e) {
			throw new PDFServiceException(e);
		}
	}

	public static BLOB generarPdf(CLOB xml, String nombreTransformador, BLOB pdf) {
		try {
			
			if (xml == null) {
				throw new PDFServiceException("El xml de entrada no puede ser nulo");
			}
			
			if (nombreTransformador == null) {
				throw new PDFServiceException("No se ha especificado una XSL");
			}			

			if (pdf == null) {
				pdf = BLOB.createTemporary(xml.getOracleConnection(), true, BLOB.DURATION_SESSION);
			}
			
			PDFBuffer input = new PDFBuffer(xml.getAsciiStream(),
					(int) xml.length());

			PDFBuffer res = getInstance()
					.generarPDF(input, nombreTransformador);
			
			OutputStream os = pdf.setBinaryStream(1L);
			os.write(res.getContent(), 0, res.getLongitud());
			os.flush();
			os.close();
			return pdf;
		} catch (Exception e) {
			throw new PDFServiceException("Error en invocacion al servicio Java",e);
		}

	}

	private static PDFClient getInstance() {
		return new PDFClient();
	}

}