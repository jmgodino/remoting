import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import util.FileHelper;
import util.PDFClientSqlite;

public class PDFClientTest {

	public static void main(String args[]) throws Exception {
		final String fileXml = args[0];
		final String transformer = args[1];
		final String filePdf = args[2];
		final Random rnd = new Random();
		ExecutorService pool = Executors.newFixedThreadPool(5);
		
		for (int i=0; i<100; i++) {

			pool.execute(new Runnable() {
				
				@Override
				public void run() {
					PDFClientSqlite client = new PDFClientSqlite();
					client.setRetries(2);
					try {
						FileHelper.writeFile(filePdf+rnd.nextInt(10000)+".pdf", client.generarPDF(FileHelper.readFile(fileXml), transformer).getContent());
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			});

			
			}	
		pool.shutdown();
	}
	


}
