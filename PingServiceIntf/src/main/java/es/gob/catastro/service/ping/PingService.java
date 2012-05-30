package es.gob.catastro.service.ping;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface PingService extends Remote {
	
	public String ping () throws RemoteException;

}
