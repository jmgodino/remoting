package es.gob.catastro.service.core.logging;

import org.slf4j.LoggerFactory;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;
import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.encoder.PatternLayoutEncoder;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.ConsoleAppender;
import ch.qos.logback.core.FileAppender;
import ch.qos.logback.core.rolling.FixedWindowRollingPolicy;
import ch.qos.logback.core.rolling.RollingFileAppender;
import ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy;

public class LogPluginConfiguration {

	private static final int MAX_BACKUP = 3;
	private String logFile;
	private String pattern;
	private String format = "%d{ABSOLUTE} %5p %C{0}:%L - %m%n";
	private String level = Level.WARN.toString();
	private Boolean rolling = true;
	private Long maxSize = 10000000L;
	private Boolean truncate = false;
	private Boolean buffered = true;

	static {
		LoggerContext loggerContext = (LoggerContext) LoggerFactory.getILoggerFactory();
		Logger rootLogger = (Logger) LoggerFactory.getLogger(Logger.ROOT_LOGGER_NAME);
		rootLogger.setLevel(Level.WARN);

		PatternLayoutEncoder encoder = new PatternLayoutEncoder();
		encoder.setPattern(loggerContext.getProperty("DEFAULT_PATTERN"));
		encoder.setContext(loggerContext);
		encoder.setImmediateFlush(false);
		encoder.start();

		ConsoleAppender<ILoggingEvent> appender = new ConsoleAppender<ILoggingEvent>();
		appender.setEncoder(encoder);
		appender.setContext(loggerContext);

		rootLogger.addAppender(appender);
	}

	public void setTruncate(Boolean truncate) {
		this.truncate = truncate;
	}

	public void setBuffered(Boolean buffered) {
		this.buffered = buffered;
	}

	public void setBufferSize(Integer bufferSize) {
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public void setMaxSize(Long maxSize) {
		this.maxSize = maxSize;
	}

	public void setPattern(String pattern) {
		this.pattern = pattern;
	}

	public void setRolling(Boolean rolling) {
		this.rolling = rolling;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public void setLogFile(String logFile) {
		this.logFile = logFile;
	}

	public void configure() {
		if (logFile == null) {
			throw new IllegalArgumentException("LogPluginConfiguration - No se ha indicado el nombre del fichero de log");
		}

		if (pattern == null) {
			throw new IllegalArgumentException("LogPluginConfiguration - No se ha indicado el patron del fichero de log");
		}

		try {
			LoggerContext loggerContext = (LoggerContext) LoggerFactory.getILoggerFactory();

			PatternLayoutEncoder encoder = new PatternLayoutEncoder();
			encoder.setContext(loggerContext);
			encoder.setPattern(format);
			encoder.setImmediateFlush(!buffered);
			encoder.start();

			FileAppender<ILoggingEvent> fa = null;

			if (rolling) {
				fa = createRollingFileAppender(loggerContext, encoder);
			} else {
				fa = createFlatFileAppender(loggerContext, encoder);
			}

			// Creamos el log y lo inicializamos
			Logger logger = (Logger) LoggerFactory.getLogger(pattern);
			logger.setLevel(Level.toLevel(level));
			logger.addAppender(fa);
			logger.setAdditive(false);

			logger.info("Logger inicializado");

		} catch (Throwable e) {
			System.out.println("LogPluginConfiguration - Error configurando framework logging: " + e.toString());
		}
	}

	protected FileAppender<ILoggingEvent> createFlatFileAppender(LoggerContext loggerContext, PatternLayoutEncoder encoder) {
		FileAppender<ILoggingEvent> fa = new FileAppender<ILoggingEvent>();
		
		fa.setContext(loggerContext);
		fa.setEncoder(encoder);
		fa.setAppend(!truncate);		
		fa.setFile(logFile);
		fa.setName(pattern);
		fa.start();
		
		return fa;
	}

	protected FileAppender<ILoggingEvent> createRollingFileAppender(LoggerContext loggerContext, PatternLayoutEncoder encoder) {
		RollingFileAppender<ILoggingEvent> rfa = new RollingFileAppender<ILoggingEvent>();

		rfa.setContext(loggerContext);
		rfa.setEncoder(encoder);
		rfa.setAppend(!truncate);
		rfa.setFile(logFile);
		rfa.setName(pattern);		

		SizeBasedTriggeringPolicy<ILoggingEvent> triggerPolicy = new SizeBasedTriggeringPolicy<ILoggingEvent>();
		triggerPolicy.setContext(loggerContext);
		triggerPolicy.setMaxFileSize(maxSize.toString());

		FixedWindowRollingPolicy rollingPolicy = new FixedWindowRollingPolicy();
		rollingPolicy.setContext(loggerContext);
		rollingPolicy.setFileNamePattern(logFile + ".%i");
		rollingPolicy.setMinIndex(1);
		rollingPolicy.setMaxIndex(MAX_BACKUP);
		rollingPolicy.setParent(rfa);
		
		rfa.setTriggeringPolicy(triggerPolicy);
		rfa.setRollingPolicy(rollingPolicy);

		triggerPolicy.start();
		rollingPolicy.start();
		rfa.start();
		
		LoggerFactory.getLogger(Logger.ROOT_LOGGER_NAME).info("Se ha creado un log rotatorio: "+logFile+" para el patron: "+pattern);
		
		return rfa;
	}

}