package es.gob.catastro.service.rmi.client.util;

public class RmiLocation {

	String host;
	Integer port;
	
	public RmiLocation(String host, Integer port) {
		super();
		this.host = host;
		this.port = port;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public Integer getPort() {
		return port;
	}
	public void setPort(Integer port) {
		this.port = port;
	}
	@Override
	public String toString() {
		return "RmiLocation [host=" + host + ", port=" + port + "]";
	}
	
	
	
	
	
}
