package es.gob.catastro.service.core.inspector;

import java.text.DecimalFormat;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

public class TraceServerInfo implements Runnable {

	private static final Logger log = LoggerFactory.getLogger(TraceServerInfo.class);
	private long interval;
	private DecimalFormat fmt;

	public TraceServerInfo() {
		super();
		fmt = (DecimalFormat)DecimalFormat.getInstance(new Locale("es","ES"));
		ExecutorService exec = Executors.newSingleThreadExecutor();
		exec.execute(this);
	}

	public long getInterval() {
		return interval;
	}

	public void setInterval(long interval) {
		this.interval = interval;
	}

	public void traceThreads() {
		log.info("Numero de threads activos: " + Thread.getAllStackTraces().size());
	}

	public void traceMemory() {
		long freeMem = Runtime.getRuntime().freeMemory();
		long totalMem = Runtime.getRuntime().totalMemory();
		double porcentaje = 100 * ((double) freeMem / (double) totalMem);

		log.info("Memoria libre: " + fmt.format(freeMem) + " bytes de " + fmt.format(totalMem) + " bytes reservados -> " + fmt.format(porcentaje) + "%");
	}

	@Override
	public void run() {
		log.info("Iniciando hilo de monitorizacion");
		while (true) {
			try {
				traceThreads();
				traceMemory();
				Thread.sleep(interval);
			} catch (Exception e) {
				log.error("Error en el hilo de monitorizacion. Abortando");
				return;
			}
		}

	}

}
