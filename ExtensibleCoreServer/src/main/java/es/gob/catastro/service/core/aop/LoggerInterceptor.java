package es.gob.catastro.service.core.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggerInterceptor {

	private static final Logger log = LoggerFactory.getLogger(LoggerInterceptor.class);

	public Object executeCall(ProceedingJoinPoint pjp) throws Throwable {
		String call = pjp.getTarget().getClass().getName() + "." + pjp.getSignature().getName();

		log.debug("CALL: " + call);
		try {
			long ini = System.currentTimeMillis();
			Object obj = pjp.proceed();
			long fin = System.currentTimeMillis();
			log.info("OK: " + call + " duracion llamada (mseg): " + (fin - ini));
			return obj;
		} catch (Throwable ex) {
			log.info("ERR: " + call, ex);
			throw ex;
		}
	}

}
