package es.gob.catastro.service.core.manager;

import java.io.File;
import java.io.FileFilter;
import java.io.FilenameFilter;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import es.gob.catastro.service.core.exception.RemotingServerException;

public class PluginClassloader  {

	private static Logger log = LoggerFactory.getLogger(PluginClassloader.class);

	
	public static final ClassLoader getPluginClassLoader(String service) {
	    return new URLClassLoader(gerServiceUrls(service),ClassLoader.getSystemClassLoader());
	}

	private static URL[] gerServiceUrls(String service) {

		if (service == null || service.isEmpty()) {
			throw new RemotingServerException("No se ha especificado el servicio para el plugin: " + service);
		}

		String serviceHome = getServiceHome(service);
		log.info("Cargando classpath para el servicio: {} en la ruta {}", service, serviceHome);

		if (serviceHome == null) {
			throw new RemotingServerException("No se ha encontrado el directorio del plugin");
		}

		File libs = new File(serviceHome);

		// Filtro que busca todos los ficheros de librerias Java
		FileFilter filter = new LibraryFilter();
		File[] libraryFiles = libs.listFiles(filter);

		return produceUrlList(service, libraryFiles);

	}

	private static String getServiceHome(final String service) {
		String serviceBaseDir = System.getProperty("remoting.services.plugin.home");

		if (serviceBaseDir == null || serviceBaseDir.isEmpty()) {
			throw new RemotingServerException("No se ha especificado el directorio de plugins <remoting.services.plugin.home>");
		}

		Pattern filePattern = Pattern.compile("(\\w+)Plugin");
		Matcher matcher = filePattern.matcher(service);

		if (matcher.find()) {
			String pluginHome = matcher.group(1);
			log.info("El directorio del servicio: {} es: {}" , service, pluginHome);

			// Filtro que busca todos los directorios cuyo nombre en mayusculas
			// coincida con el del plugin sin la extension Plugin al final
			FilenameFilter filter = new PluginHomeFilter(pluginHome);

			File pluginDir = new File(serviceBaseDir);
			String[] directorios = pluginDir.list(filter);

			return selectPluginHome(service, pluginDir, directorios);
		} else {
			throw new RemotingServerException("No se ha encontrado el directorio del plugin: " + service);
		}

	}

	public static String selectPluginHome(String service, File pluginDir, String[] directorios) {
		if (directorios == null || directorios.length == 0) {
			throw new RemotingServerException("No se ha encontrado el directorio para el plugin: " + service);
		}
		String serviceHome = directorios[0];
		String absoluteServiceHome = pluginDir + File.separator + serviceHome;
		log.info("El directorio del plugin: {} esta en la ruta: {}" , service, absoluteServiceHome);
		return absoluteServiceHome;

	}

	public static URL[] produceUrlList(String service, File[] librerias) {
		URL[] urls = null;

		if (librerias == null || librerias.length == 0) {
			throw new RemotingServerException("No se han econtrado librerias para el plugin: " + service);
		}

		int i = 0;
		try {
			urls = new URL[librerias.length];
			for (File lib : librerias) {
				urls[i] = lib.toURI().toURL();
				log.error("Cargando libreria: {}", urls[i]);
				i++;
			}
		} catch (Exception e) {
			log.error("Error cargando classloader del servicio: {}",  service, e);
		}
		return urls;
	}

}

class LibraryFilter implements FileFilter {

	@Override
	public boolean accept(File file) {
		String p = file.getAbsolutePath();
		return p != null && (p.toLowerCase().endsWith(".jar") || p.toLowerCase().endsWith(".zip"));
	}

}

class PluginHomeFilter implements FilenameFilter {

	private String pluginHome;

	public PluginHomeFilter(String pluginHome) {
		this.pluginHome = pluginHome;
	}

	@Override
	public boolean accept(File file, String name) {
		return file.isDirectory() && name != null && (name.toUpperCase().matches(pluginHome.toUpperCase()));
	}
}
