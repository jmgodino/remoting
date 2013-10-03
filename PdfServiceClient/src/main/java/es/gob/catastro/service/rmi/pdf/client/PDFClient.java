package es.gob.catastro.service.rmi.pdf.client;

import java.io.OutputStream;
import java.rmi.RemoteException;

import oracle.sql.BLOB;
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

	public static void generarPdf(BLOB xml, String nombreTransformador, BLOB pdf)
			throws RemoteException {
		try {
			PDFBuffer input = new PDFBuffer(xml.getBinaryStream(),
					(int) xml.length());

			PDFBuffer res = getInstance()
					.generarPDF(input, nombreTransformador);

			OutputStream os = pdf.setBinaryStream(1L);
			os.write(res.getContent(), 0, res.getLongitud());
			os.flush();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private static PDFClient getInstance() {
		return new PDFClient();
	}

}