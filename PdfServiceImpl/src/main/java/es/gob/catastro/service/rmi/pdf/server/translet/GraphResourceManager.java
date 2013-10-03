package es.gob.catastro.service.rmi.pdf.server.translet;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Clase que permiten cachear recursos a usar en Fop, como fuentes e imágenes.
 * Si no se cachean dado el peculiar sistema de Classloaders del servidor RMI,
 * hay problemas a la hora de acceder a las fuentes e imagenes contenidas en el
 * jar, pero con cache se acelera el proceso y no hay problemas
 */
public class GraphResourceManager {

	private static final Logger log = LoggerFactory
			.getLogger(GraphResourceManager.class);

	private static final int BUFFER_SIZE = 500000;

	private Map<String, byte[]> map = new HashMap<String, byte[]>();

	private static GraphResourceManager singleton;

	private GraphResourceManager() {
	}

	public static synchronized GraphResourceManager getGraphResourceManager() {
		if (singleton == null) {
			singleton = new GraphResourceManager();
		}
		return singleton;
	}

	public synchronized InputStream registerResource(String name)
			throws IOException {
		if (!isResourceRegistered(name)) {
			byte[] fic = readFile(name);
			map.put(name, fic);
		}
		return getResource(name);
	}

	public InputStream getResource(String name) {
		log.debug("Returning from cache: {}", name);
		return new ByteArrayInputStream(map.get(name));
	}

	public Boolean isResourceRegistered(String name) {
		return map.get(name) != null;
	}

	private byte[] readFile(String name) throws IOException {
		InputStream is = new BufferedInputStream(getClass()
				.getResourceAsStream(name));
		ByteArrayOutputStream bos = new ByteArrayOutputStream(
				BUFFER_SIZE);
		log.info("Caching: {}", name);
		byte[] buf = new byte[100000];
		int numRead = 0;
		while ((numRead = is.read(buf)) != -1) {
			bos.write(buf, 0, numRead);
		}
		is.close();
		bos.close();
		return bos.toByteArray();
	}

}

