package es.gob.catastro.service.rmi.client;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import es.gob.catastro.service.rmi.client.util.RmiLocation;

public abstract class RmiDatabaseClient<T> extends RmiClient<T> {


	public T getService(String name) {
		
		List<RmiLocation> urls = getUrls();
		for (int i = 1; i <= getRetries(); i++) {
			try {
				return getRandomHostService(urls, name);				
			} catch (Exception e) {
				debug("Error invocando al servicio", e);
			}
		}		
		throw new RmiClientException("No se ha podido acceder al servicio remoto");	
		
	}

	private List<RmiLocation> getUrls() {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con = getConnection();
			ps = con.prepareStatement(getQuery());
			rs = ps.executeQuery();
			List<RmiLocation> urls = new ArrayList<RmiLocation>(5);
			while (rs.next()) {
				String host = rs.getString(1);
				Integer port = rs.getInt(2);
				RmiLocation loc = new RmiLocation(host, port);
				urls.add(loc);
			}
			return urls;
		} catch (Exception e) {
			throw new RmiClientException("RmiDatabaseClient - Error recuperando servicio", e);
		} finally {
			close(rs);
			close(ps);
			close(con);
		}
	}

	protected abstract String getQuery();

	protected abstract void close(Connection con);
	
	private void close(PreparedStatement ps) {
		try {
			if (ps != null)
				ps.close();
		} catch (Exception e) {
		}
	}	
	
	private void close(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
	}	

	protected abstract Connection getConnection() throws SQLException, ClassNotFoundException;
	
	
}
