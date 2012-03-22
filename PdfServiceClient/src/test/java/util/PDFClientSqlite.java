package util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import es.gob.catastro.service.pdf.PDFService;

import es.gob.catastro.service.rmi.pdf.client.PDFClient;

public class PDFClientSqlite extends PDFClient implements PDFService {

	private static final String QUERY = "select host, port from RMI_SERVER";
	
	@Override
	protected Connection getConnection() throws SQLException, ClassNotFoundException {
		Class.forName("org.sqlite.JDBC");
		return DriverManager.getConnection("jdbc:sqlite:"+System.getProperty("sqlite.datafile"));
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