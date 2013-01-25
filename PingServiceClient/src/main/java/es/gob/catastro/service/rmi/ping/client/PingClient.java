package es.gob.catastro.service.rmi.ping.client;

import java.rmi.RemoteException;
import es.gob.catastro.service.ping.PingService;
import es.gob.catastro.service.ping.PingServiceException;
import es.gob.catastro.service.rmi.client.RmiOracleClient;

public class PingClient extends RmiOracleClient<PingService> implements PingService  {
	
	public String ping() {
		PingService service = getService ("PingService");
		try {
			return service.ping();
		} catch (RemoteException e) {
			throw new PingServiceException(e);
		}
	}
	
	public static String getPing () {
		return getInstance().ping();
	}
	
	private static PingClient  getInstance (){
		return new PingClient();
	}

}
