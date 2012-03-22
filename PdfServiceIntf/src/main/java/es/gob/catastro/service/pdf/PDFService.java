package es.gob.catastro.service.pdf;

import java.rmi.Remote;
import java.rmi.RemoteException;

import es.gob.catastro.service.pdf.util.PDFBuffer;



public interface PDFService extends Remote {	
	
	public PDFBuffer generarPDF(String xml, String transformer) throws RemoteException;

}