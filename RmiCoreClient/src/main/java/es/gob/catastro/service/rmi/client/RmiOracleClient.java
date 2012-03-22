package es.gob.catastro.service.rmi.client;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ResourceBundle;

import oracle.jdbc.OracleDriver;

public class RmiOracleClient<T> extends RmiDatabaseClient<T> {

	ResourceBundle bundle = ResourceBundle.getBundle("RmiJdbc"); 
	
	@Override
	protected Connection getConnection() throws SQLException, ClassNotFoundException {
		return new OracleDriver().defaultConnection();		
	}
	
	@Override
	protected void close(Connection con) {
		// OJO no hacer nada si se ejecuta dentro de Oracle. No es necesario cerrar la conexion.
		return;
	}
	
	@Override
	protected String getQuery() {
		return bundle.getString("rmi.query.hosts");
	}

	
	
}
