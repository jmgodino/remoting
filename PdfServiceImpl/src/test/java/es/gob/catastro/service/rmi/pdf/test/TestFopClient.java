package es.gob.catastro.service.rmi.pdf.test;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import es.gob.catastro.service.rmi.pdf.server.PDFPlugin;

public class TestFopClient  {


	public static void main(String args[]) throws Exception {
		final String fileXml = args[0];
		final String transformer = args[1];
		final String filePdf = args[2];
		final Random rnd = new Random();
		ExecutorService pool = Executors.newFixedThreadPool(5);
		
		for (int i=0; i<20; i++) {

			pool.execute(new Runnable() {
			
			
				public void run() {
					try {
						writeFile(filePdf+rnd.nextInt(10000)+".pdf", new PDFPlugin().generarPDF(readFile(fileXml), transformer).getContent());
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			});

			
			}	
		pool.shutdown();
	}
	
	
	public static String readFile(String filePath) throws IOException {
        StringBuffer fileData = new StringBuffer(1000);
        BufferedReader reader = new BufferedReader(
                new InputStreamReader(new FileInputStream(filePath), "UTF-8"));
        char[] buf = new char[1024];
        int numRead=0;
        while((numRead=reader.read(buf)) != -1){
            String readData = String.valueOf(buf, 0, numRead);
            fileData.append(readData);
        }
        reader.close();
        return fileData.toString();
    }	
	
	public static void writeFile(String fileName, byte[] data) throws IOException {
		FileOutputStream fos = new FileOutputStream(fileName);
		fos.write(data);
		fos.flush();
		fos.close();
	}



	
}
