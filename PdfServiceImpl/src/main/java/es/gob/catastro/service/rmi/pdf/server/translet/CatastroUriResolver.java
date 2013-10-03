package es.gob.catastro.service.rmi.pdf.server.translet;

import java.io.IOException;

import javax.xml.transform.Source;
import javax.xml.transform.TransformerException;
import javax.xml.transform.URIResolver;
import javax.xml.transform.stream.StreamSource;

import org.apache.fop.apps.FOURIResolver;
import org.apache.fop.apps.FopFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public final class CatastroUriResolver implements URIResolver {

	private static final Logger log = LoggerFactory
			.getLogger(CatastroUriResolver.class);

	public CatastroUriResolver() {
	}

	public Source resolve(String href, String base) throws TransformerException {
		log.debug("Resolviendo desde classpath: {}", href);
		GraphResourceManager mgr = GraphResourceManager
				.getGraphResourceManager();
		if (mgr.isResourceRegistered(href)) {
			return new StreamSource(mgr.getResource(href));
		} else {
			try {
				return new StreamSource(mgr.registerResource(href));
			} catch (IOException e) {
				// En caso de no encontrarse el recurso en el classpath, sera FOP el que lo busque.
				return null;
			}
		}
	}

	public static void resolve(FopFactory fopFactory) {
		FOURIResolver fopUriResolver = (FOURIResolver) fopFactory
				.getURIResolver();
		log.debug("Registrando resolver del Catastro");
		fopUriResolver.setCustomURIResolver(new CatastroUriResolver());
	}
}