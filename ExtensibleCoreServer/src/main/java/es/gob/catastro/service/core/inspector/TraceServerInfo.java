package es.gob.catastro.service.core.inspector;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class TraceServerInfo implements Runnable {

	private static final Log log = LogFactory.getLog(TraceServerInfo.class);
	private long interval;

	public TraceServerInfo() {
		super();
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

		log.info("Memoria libre: " + freeMem + "bytes de " + totalMem + "bytes reservados -> " + porcentaje + "%");
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
