package util;


import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import es.gob.catastro.service.pdf.util.PDFBuffer;

public class FileHelper {

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
