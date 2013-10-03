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
		
		if (args.length < 4) {
			System.out.println("Modo de uso: cmd <xml> <xsl> <pdf> <max_pool_size>");
			System.exit(1);
		}
		
		System.out.println("Creando pool con "+args[3]+" elementos");
		ExecutorService pool = Executors.newFixedThreadPool(new Integer(args[3]));
		
		for (int i=0; i<1000; i++) {

			pool.execute(new Runnable() {
			
			
				public void run() {
					PDFClientSqlite client = new PDFClientSqlite();
					client.setRetries(1);
					try {
						FileHelper.writeFile(client.generarPDF(FileHelper.readFile(fileXml), transformer), filePdf+rnd.nextInt(10000)+".pdf");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			});

			
			}	
		pool.shutdown();
	}
	


}
