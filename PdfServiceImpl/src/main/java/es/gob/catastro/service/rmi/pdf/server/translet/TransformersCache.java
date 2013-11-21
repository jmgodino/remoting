package es.gob.catastro.service.rmi.pdf.server.translet;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;

public class TransformersCache {

	private static TransformersCache cache;
	private static Map<String, Templates> dictionary = Collections.synchronizedMap(new HashMap<String, Templates>());

	private TransformersCache() {
	}

	public static synchronized TransformersCache getInstance() {
		if (cache == null) {
			cache = new TransformersCache();
		}
		return cache;
	}


	public Transformer getTransformer(String transformerName)
			throws TransformerException {
		Templates current = dictionary.get(transformerName);
		if (current == null) {
			current = newTemplate(transformerName);
			dictionary.put(transformerName, current);
		}
		return current.newTransformer();
	}

	protected Templates newTemplate(String transformerName)
			throws TransformerException {
		TransformerFactory tf = TransformerFactory.newInstance();
		return tf.newTemplates(new CatastroUriResolver().resolve(
				"/stylesheets/" + transformerName + ".xsl", ""));
	}

}
