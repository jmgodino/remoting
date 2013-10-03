package es.gob.catastro.service.rmi.pdf.server.translet;

import org.apache.fop.apps.FopFactory;

public class FopCacheManager {


	private FopFactory factory;
	
	private static FopCacheManager singleton;
	
	private FopCacheManager() {
	}
	
	public static synchronized FopCacheManager getFopCacheManager() {
		if (singleton == null) {
			singleton = new FopCacheManager();
		}
		return singleton;
	}
	
	public synchronized void registerFactory(FopFactory factory) {
		if (!isRegistered()) {
			this.factory = factory;
		}	
	}
	
	public FopFactory getFactory() {
		return factory;
	}
	
	public Boolean isRegistered() {
		return factory != null;
	}
	
}
