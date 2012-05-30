package util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.sqlite.SQLiteConfig;
import es.gob.catastro.service.ping.PingService;
import es.gob.catastro.service.rmi.ping.client.PingClient;


public class PingClientSqllite  extends PingClient implements PingService {

		private static final String QUERY = "select host, port from RMI_SERVER";
		
		@Override
		protected Connection getConnection() throws SQLException, ClassNotFoundException {
			Class.forName("org.sqlite.JDBC");
			SQLiteConfig config = new SQLiteConfig();
			config.setReadOnly(true);	
			//return DriverManager.getConnection("jdbc:sqlite:"+System.getProperty("sqlite.datafile"), config.toProperties());
			return DriverManager.getConnection("jdbc:sqlite:test.db", config.toProperties());
		}
		
		@Override
		protected void close(Connection con) {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
			}
			return;
		}

		@Override
		protected String getQuery() {			
			return QUERY;
		}
		
		
	}


