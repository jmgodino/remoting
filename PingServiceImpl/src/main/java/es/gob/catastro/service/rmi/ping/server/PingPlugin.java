package es.gob.catastro.service.rmi.ping.server;

import java.rmi.RemoteException;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

import es.gob.catastro.service.ping.PingService;
import es.gob.catastro.service.ping.PingServiceException;


public class PingPlugin implements PingService {
	private static final Logger log = LoggerFactory.getLogger(PingPlugin.class);
	
	@Override
	public String ping() throws RemoteException  {
		try{
			return "Fuck you! from " +  java.net.InetAddress.getLocalHost().getHostName();		
	   } catch (Exception e) {
		log.error("Error en el Ping", e);
  		throw new PingServiceException("Error en el plugin de Ping", e);
	   }
	}

}
