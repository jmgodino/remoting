package es.gob.catastro.service.core.jmx;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import es.gob.catastro.service.core.exception.RemotingServerException;
import es.gob.catastro.service.core.manager.PluginClassloader;

public class ServiceReloadBean implements ServiceReload {

	private static final String LOGGING = "logging";
    private static Logger log = LoggerFactory.getLogger(ServiceReloadBean.class);
	private static final String CORE = "serverCore";
	private static Map<String, ClassPathXmlApplicationContext> context = new HashMap<String, ClassPathXmlApplicationContext>();

	@Override
	public void reloadService(String service) {
		if (CORE.equalsIgnoreCase(service)) {
			throw new IllegalArgumentException("No esta permitido parar el servicio Core de la aplicacion");
		}
		if (service == null || service.isEmpty()) {
			throw new IllegalArgumentException("No se ha definido el servicio a recargar de la aplicacion");
		}
		stopService(service);
		startService(service);
	}

	@Override
	public void stopService(String service) {
		if (CORE.equalsIgnoreCase(service)) {
			throw new IllegalArgumentException("No esta permitido parar el servicio Core de la aplicacion");
		}
		if (service == null || service.isEmpty()) {
			throw new IllegalArgumentException("No se ha definido el servicio a parar de la aplicacion");
		}
		ClassPathXmlApplicationContext cpAC = context.get(service);
		cpAC.close();
		log.error("Servicio parado: {}", service);
		context.remove(service);
	}

	protected void startCoreService() {
		log.info("Cargando el servicio principal");
		ClassPathXmlApplicationContext cpAC = new ClassPathXmlApplicationContext();
		cpAC.setConfigLocation(getServiceDescriptor(CORE));
		cpAC.refresh();
		context.put(CORE, cpAC);
		log.info("Servicio principal cargado");
	}

	@Override
	public void startService(final String service) {
		if (service == null || service.isEmpty()) {
			throw new IllegalArgumentException("No se ha definido el servicio a cargar de la aplicacion");
		}
		if (context.get("service") != null) {
		    throw new RemotingServerException("El servicio ya esta cargado en aplicacion, debe pararlo primero");
		}
		
		log.info("Cargando el servicio: {}", service);
		ClassLoader pluginLoader = PluginClassloader.getPluginClassLoader(service);
		ClassPathXmlApplicationContext cpAC = new ClassPathXmlApplicationContext();
		cpAC.setClassLoader(pluginLoader);
		String config = getServiceDescriptor(service);
		log.info("Estableciendo configuracion: {}", config);
		cpAC.setConfigLocation(config+","+getServiceDescriptor(LOGGING));
		cpAC.setParent(context.get(CORE));
		cpAC.refresh();
		context.put(service, cpAC);
		log.error("Servicio cargado: {}", service);
	}

	private String getServiceDescriptor(String service) {
		return "classpath*:plugin/" + service + "-catastro-services.xml";
	}

	@Override
	public String getServices() {
		StringBuilder sb = new StringBuilder();
		for (String service : context.keySet()) {
			sb.append(service);
			sb.append(",");
		}
		return sb.toString();
	}

}
