package es.gob.catastro.service.rmi.client;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.util.List;
import java.util.Random;

import es.gob.catastro.service.rmi.client.util.RmiLocation;

public class RmiClient<T> {

	public T getService(List<RmiLocation> urls, String name) {
		
		if (urls == null || urls.size() == 0) {
			throw new IllegalArgumentException("No se ha indicado una lista de hosts RMI");
		}
		
		for (RmiLocation url : urls) {
			try {
				return getService(url.getHost(), url.getPort(), name);
			} catch (Exception e) {
				debug("Error obteniendo objeto remoto", e);
			}
		}
		throw new RmiClientException("No se ha podido encontrar el servicio remoto: " + name	+ " en la lista de RmiLocation");
	}

	/**  Para sacar un elemento al azar, sacamos un numero aleatorio, y si no se puede
	 *   conecta con el host, lo quitamos de la lista y volvemos a sacar otro de los disponibles
	 *   Se hacen tanto intentos como elementos hay en la lista
	 */ 
	public T getRandomHostService(List<RmiLocation> urls, String name) {
		
		if (urls == null || urls.size() == 0) {
			throw new IllegalArgumentException("No se ha indicado una lista de hosts RMI");
		}
		
		Random rnd = new Random();
		Integer intentos = urls.size();
		
		for (int pos=0; pos<intentos; pos++) {
			RmiLocation url = urls.get(rnd.nextInt(urls.size()));
			try {
				T service = getService(url.getHost(), url.getPort(), name);
				debug("Recuperado el objeto remoto, intento "+pos+"/"+intentos, null);
				return service;
			} catch (Exception e) {
				debug("Error obteniendo el objeto remoto, intento "+pos+"/"+intentos, e);
				urls.remove(url);
			}
		}
		throw new RmiClientException("No se ha podido encontrar el servicio remoto: " + name	+ " en la lista de RmiLocation");
	}



	/**
	 * Permite recuperar un objeto remoto de un host y un puerto determinado
	 * @param host
	 * @param port
	 * @param name
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public T getService(String host, Integer port, String name)  {
		
		if (host == null) {
			throw new IllegalArgumentException("No se ha especificado el host RMI");
		}

		if (port == null || port <= 0) {
			throw new IllegalArgumentException("No se ha especificado el puerto RMI: "+port);
		}
		
		T service=null;
		
		try {
			Registry registry = LocateRegistry.getRegistry(host, port);
			service = (T) registry.lookup(name);
		} catch (Exception e) {
			throw new RmiClientException("No se ha podido encontrar el servicio remoto: " + name + " en la ubicacion: rmi://" + host + ":" + port+"/"+name);			
		}
		if (service == null) {
			throw new RmiClientException("No se ha podido instanciar el servicio remoto: " + name + " en la ubicacion: rmi://" + host + ":" + port+"/"+name);
		} else {
			return service;
		}
	}

	/**
	 * Funcion auxiliar para trazar mensajes de error
	 * @param message
	 * @param e
	 */
	
	protected static void debug(String message, Throwable e) {
		System.out.println(message + " " + ((e == null) ? "" : e.toString()));

	}

}