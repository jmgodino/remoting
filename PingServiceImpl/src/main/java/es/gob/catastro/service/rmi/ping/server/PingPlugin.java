package es.gob.catastro.service.rmi.ping.server;

import java.rmi.RemoteException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import es.gob.catastro.service.ping.PingService;
import es.gob.catastro.service.ping.PingServiceException;


public class PingPlugin implements PingService {
	private static final Log log = LogFactory.getLog(PingPlugin.class);
	
	@Override
	public String ping() throws RemoteException  {
		try{
			return "Ack from" +  java.net.InetAddress.getLocalHost().getHostName();		
	   } catch (Exception e) {
		log.error("Error en el Ping", e);
  		throw new PingServiceException("Error en el plugin de Ping", e);
	   }
	}

}
