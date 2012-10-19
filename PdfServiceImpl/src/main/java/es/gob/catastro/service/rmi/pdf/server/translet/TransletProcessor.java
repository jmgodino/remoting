package es.gob.catastro.service.rmi.pdf.server.translet;

import java.io.ByteArrayOutputStream;
import java.io.StringReader;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;

import es.gob.catastro.service.pdf.PDFServiceException;


public class TransletProcessor  {

	private static final String TRANSLET_PACKAGE = "es.gob.catastro.service.rmi.pdf.server.translet";
	private static final Logger log = LoggerFactory.getLogger(TransletProcessor.class);

	Transformer transformer;
	FopFactory fopFactory;
	

	private static final int INIT_SIZE = 50000; // Por el tamanio de los
												// ficheros de prueba

	public TransletProcessor(String transformer) {
		init(transformer);
	}



	public byte[] transform(String xml) {

		try {
			long ini = System.currentTimeMillis();
			ByteArrayOutputStream out = new ByteArrayOutputStream(INIT_SIZE);
			Fop fop = fopFactory.newFop("application/pdf",
					fopFactory.newFOUserAgent(), out);
			transformer.transform(new StreamSource(new StringReader(xml)),
					new SAXResult(fop.getDefaultHandler()));
			long fin = System.currentTimeMillis();
			log.debug("Tiempo del transformador: " + (fin - ini) + "ms");
			return out.toByteArray();
		} catch (Exception e) {
			log.error("Error en la transforamcion", e);
			throw new PDFServiceException("Error transformando en translet", e);
		}

	}


	private void init(String trans) {
		try {
			log.debug("Inicializando translet: "+trans);
			TransformerFactory tf = TransformerFactory.newInstance();
			tf.setAttribute("use-classpath", Boolean.TRUE);
			tf.setAttribute("package-name", TRANSLET_PACKAGE);
			transformer = tf.newTransformer(new StreamSource(trans));
			fopFactory = FopFactory.newInstance();
		} catch (Exception e) {
			log.error("Error en la inicializacion", e);
			throw new PDFServiceException("Error iniciando translet", e);
		}
	}


}
