package es.gob.catastro.service.logging;

import java.io.IOException;

import org.apache.log4j.ConsoleAppender;
import org.apache.log4j.FileAppender;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;
import org.apache.log4j.RollingFileAppender;

public class LogPluginConfiguration {

	private String logFile;
	private String pattern;
	private String format = "%d{ABSOLUTE} %5p %c{5}:%L - %m%n";
	private String level = Level.WARN.toString();
	private Boolean rolling = true;
	private Long maxSize = 10000000L;
	private Boolean truncate = false;
	private Boolean buffered = true;
	private Integer bufferSize = 8;

	static {
		Logger rootLogger = Logger.getRootLogger();
		rootLogger.setLevel(Level.WARN);
		PatternLayout rootLayout = new PatternLayout(PatternLayout.DEFAULT_CONVERSION_PATTERN);
		rootLogger.addAppender(new ConsoleAppender(rootLayout));
	}

	public void setTruncate(Boolean truncate) {
		this.truncate = truncate;
	}

	public void setBuffered(Boolean buffered) {
		this.buffered = buffered;
	}

	public void setBufferSize(Integer bufferSize) {
		this.bufferSize = bufferSize;
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
			Logger logger = Logger.getRootLogger().getLoggerRepository().getLogger(pattern);
			logger.setAdditivity(false);
			logger.setLevel(Level.toLevel(level));	
			PatternLayout layout = new PatternLayout(format);
			FileAppender fa = null;

			if (rolling) {
				fa = new RollingFileAppender(layout, logFile, !truncate);
				((RollingFileAppender) fa).setMaximumFileSize(maxSize);
			} else {
				fa = new FileAppender(layout, logFile, !truncate);
			}

			fa.setBufferedIO(buffered);
			fa.setBufferSize(bufferSize);
			logger.addAppender(fa);

		} catch (IOException e) {
			System.out
					.println("LogPluginConfiguration - Error configurando framework logging: "
							+ e.toString());
		}
	}

}