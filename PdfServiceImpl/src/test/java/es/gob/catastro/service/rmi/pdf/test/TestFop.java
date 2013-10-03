package es.gob.catastro.service.rmi.pdf.test;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import es.gob.catastro.service.pdf.util.PDFBuffer;
import es.gob.catastro.service.rmi.pdf.server.PDFPlugin;

public class TestFop {

	public static void main(String args[]) throws Exception {
		final String fileXml = args[0];
		final String transformer = args[1];
		final String filePdf = args[2];
		final Random rnd = new Random();
		ExecutorService pool = Executors.newFixedThreadPool(5);

		for (int i = 0; i < 100; i++) {

			pool.execute(new Runnable() {

				public void run() {
					try {
						writeFile(new PDFPlugin().generarPDF(readFile(fileXml),
								transformer), filePdf + rnd.nextInt(10000)
								+ ".pdf");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			});

		}
		pool.shutdown();
	}

	public static PDFBuffer readFile(String filePath) throws IOException {
		ByteArrayOutputStream bos = new ByteArrayOutputStream(100000);
		BufferedInputStream is = new BufferedInputStream(new FileInputStream(
				filePath));
		byte[] buf = new byte[1024];
		int numRead = 0;
		while ((numRead = is.read(buf)) != -1) {
			bos.write(buf, 0, numRead);
		}
		is.close();
		return new PDFBuffer(bos.toByteArray());
	}

	public static void writeFile(PDFBuffer data, String fileName)
			throws IOException {
		FileOutputStream fos = new FileOutputStream(fileName);
		fos.write(data.getContent(), 0, data.getLongitud());
		fos.flush();
		fos.close();
	}

}
