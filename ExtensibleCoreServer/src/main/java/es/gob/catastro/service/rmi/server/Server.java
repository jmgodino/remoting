package es.gob.catastro.service.rmi.server;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Server {

	public static void main(String args[]) {
		try {
			new ClassPathXmlApplicationContext("classpath*:plugin/*-catastro-services.xml");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
