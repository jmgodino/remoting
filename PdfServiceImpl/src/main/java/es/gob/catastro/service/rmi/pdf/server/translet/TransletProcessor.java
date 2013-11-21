package es.gob.catastro.service.rmi.pdf.server.translet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.avalon.framework.configuration.Configuration;
import org.apache.avalon.framework.configuration.ConfigurationException;
import org.apache.avalon.framework.configuration.DefaultConfigurationBuilder;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xml.sax.SAXException;

import es.gob.catastro.service.pdf.PDFServiceException;
import es.gob.catastro.service.pdf.util.PDFBuffer;

public class TransletProcessor {

	private static final String PDF_MIMETYPE = "application/pdf";
	private static final String FONTS_DIRECTORY = "FONTS_DIRECTORY";
	private static final String FOP_CONFIG_FILE = "META-INF/fop.xconf";
	private static final Logger log = LoggerFactory
			.getLogger(TransletProcessor.class);

	String transformerName;

	private static final int INIT_SIZE = 50000; // Tunear en base al tamaño de
												// los PDF

	public TransletProcessor(String transformer) {
		this.transformerName = transformer;
	}

	public byte[] transform(PDFBuffer xml) {

		try {

			Transformer transformer = getTransformer();

			FopFactory fopFactory = getFopFactory();

			ByteArrayOutputStream out = new ByteArrayOutputStream(INIT_SIZE);
			Fop fop = fopFactory.newFop(PDF_MIMETYPE,
					fopFactory.newFOUserAgent(), out);
			transformer.transform(new StreamSource(xml.getInputStream()),
					new SAXResult(fop.getDefaultHandler()));
			return out.toByteArray();
		} catch (Exception e) {
			log.error("Error en la transformacion", e);
			throw new PDFServiceException("Error transformando en translet", e);
		}

	}

	protected FopFactory getFopFactory() throws ConfigurationException,
			SAXException, IOException {
		FopCacheManager cacheMgr = FopCacheManager.getFopCacheManager();
		if (cacheMgr.isRegistered()) {
			return cacheMgr.getFactory();
		} else {
			FopFactory fopFact = FopFactory.newInstance();
			loadFonts(fopFact);
			loadUriResolver(fopFact);
			cacheMgr.registerFactory(fopFact);
			return fopFact;
		}

	}



	protected Transformer getTransformer()
			throws TransformerFactoryConfigurationError, TransformerException {
		log.debug("Inicializando translet basado en xsl: {}", transformerName);
		return TransformersCache.getInstance().getTransformer(transformerName);
	}

	private void loadUriResolver(FopFactory fopFactory) {
		CatastroUriResolver.resolve(fopFactory);
	}

	private void loadFonts(FopFactory fopFactory)
			throws ConfigurationException, SAXException, IOException {
		ClassLoader loader = this.getClass().getClassLoader();
		InputStream confStream = loader.getResourceAsStream(FOP_CONFIG_FILE);
		DefaultConfigurationBuilder cfgBuilder = new DefaultConfigurationBuilder();
		Configuration cfg = cfgBuilder.build(confStream);
		fopFactory.setUserConfig(cfg);
		fopFactory.getFontManager().setFontBaseURL(
				System.getProperty(FONTS_DIRECTORY));
		confStream.close();
	}

}
