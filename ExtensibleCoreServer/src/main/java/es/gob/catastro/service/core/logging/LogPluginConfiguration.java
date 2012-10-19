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
	private String format = "%d{ABSOLUTE} %5p %c{5}:%L - %m%n";
	private String level = Level.WARN.toString();
	private Boolean rolling = true;
	private Long maxSize = 10000000L;
	private Boolean truncate = false;
	private Boolean buffered = true;

	static {
		LoggerContext loggerContext = (LoggerContext) LoggerFactory.getILoggerFactory();
		Logger rootLogger = (Logger)LoggerFactory.getLogger(Logger.ROOT_LOGGER_NAME);
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
			throw new IllegalArgumentException(
					"LogPluginConfiguration - No se ha indicado el nombre del fichero de log");
		}

		if (pattern == null) {
			throw new IllegalArgumentException(
					"LogPluginConfiguration - No se ha indicado el patron del fichero de log");
		}

		try {
			LoggerContext loggerContext = (LoggerContext) LoggerFactory.getILoggerFactory();
			Logger logger = (Logger)LoggerFactory.getLogger(Logger.ROOT_LOGGER_NAME);
			logger.setLevel(Level.toLevel(level));	
			
			PatternLayoutEncoder encoder = new PatternLayoutEncoder();
			encoder.setContext(loggerContext);
			encoder.setPattern(format);
			encoder.setImmediateFlush(!buffered);
			encoder.start();
			FileAppender<ILoggingEvent> fa = null;

			if (rolling) {
				fa = new RollingFileAppender<ILoggingEvent>();
				RollingFileAppender<ILoggingEvent> rfa = (RollingFileAppender<ILoggingEvent>)fa;
				fa.setFile(logFile);
				fa.setEncoder(encoder);
				fa.setAppend(!truncate);
				SizeBasedTriggeringPolicy<ILoggingEvent> triggerPolicy = new SizeBasedTriggeringPolicy<ILoggingEvent>();
				triggerPolicy.setMaxFileSize(maxSize.toString());
				FixedWindowRollingPolicy rollingPolicy = new FixedWindowRollingPolicy();
				rollingPolicy.setMaxIndex(MAX_BACKUP);
				rfa.setTriggeringPolicy(triggerPolicy );
				rfa.setRollingPolicy(rollingPolicy);
			} else {
				fa = new FileAppender<ILoggingEvent>();
				fa.setFile(logFile);
				fa.setEncoder(encoder);
				fa.setAppend(!truncate);
			}

			fa.setContext(loggerContext);
			logger.addAppender(fa);
			

		} catch (Throwable e) {
			System.out
					.println("LogPluginConfiguration - Error configurando framework logging: "
							+ e.toString());
		}
	}

}