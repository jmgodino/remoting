import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

import org.apache.commons.dbcp.BasicDataSource;

public class Stresser {

	/**
	 * @param args
	 * @throws Exception
	 */
	public static void main(String args[]) throws Exception {

		if (args.length < 6) {
			System.out.println("Modo de uso: cmd <bd.url> <bd.user> <bd.paswd> <maxThreads> <requests> <plsql>");
			System.exit(1);
		}

		Integer max = Integer.parseInt(args[3]);

		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName("oracle.jdbc.OracleDriver");
		ds.setUrl(args[0]);
		ds.setUsername(args[1]);
		ds.setPassword(args[2]);
		ds.setInitialSize(max);
		ds.setMaxActive(max);
		ds.setMinIdle(max);
		ds.setMinEvictableIdleTimeMillis(50000);
		ds.setTimeBetweenEvictionRunsMillis(50000);

		ExecutorService serv = Executors.newFixedThreadPool(max);
		for (int i = 0; i < Integer.parseInt(args[4]); i++) {
			serv.execute(new Test(ds, args[5]));
		}
		serv.shutdown();
		serv.awaitTermination(10, TimeUnit.MINUTES);
		ds.close();
	}
}

class Test implements Runnable {

	BasicDataSource ds;
	String procedure;
	private static AtomicInteger contador = new AtomicInteger(0);

	public Test(BasicDataSource ds, String procedure) {
		this.ds = ds;
		this.procedure = procedure;
	}

	@Override
	public void run() {
		Connection con = null;
		try {
			con = ds.getConnection();
			System.out.println("Invocando servicio RMI mediante BB.DD. "+contador.incrementAndGet());
			CallableStatement cs = con.prepareCall("{ call "+procedure+"}");
			cs.execute();
			cs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		}

	}
}