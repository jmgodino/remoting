package es.gob.catastro.service.core.server;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import es.gob.catastro.service.core.jmx.ServiceReloadBean;

public class Server extends ServiceReloadBean {

	private static Logger log = LoggerFactory.getLogger(Server.class);

	public static void main(String[] args) {
		Server s = new Server();
		s.startAll();

	}

	private void startAll() {
		log.info("Arrancando el servidor RMI");
		List<String> services = getServicesFromConfig();

		// Arrancamos el servicio central
		startCoreService();

		// Y luego el resto de plugins
		for (String service : services) {
			try {
				startService(service);
			} catch (Exception e) {
				log.error("Error arrancando el servicio", e);
			}
		}
	}

	private static List<String> getServicesFromConfig() {
		int i = 1;
		String prefix = "service.plugin.name.";
		List<String> services = new ArrayList<String>();
		while (System.getProperty(prefix + i) != null) {
			services.add(System.getProperty(prefix + i));
			i++;
		}
		return services;
	}

}
