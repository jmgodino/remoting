import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import util.PingClientSqllite;

public class PingClientTest {
	
	public static void main(String args[]) throws Exception {
		
		ExecutorService pool = Executors.newFixedThreadPool(5);
		
		for (int i=0; i<1; i++) {

			pool.execute(new Runnable() {		
				
				public void run() {
					PingClientSqllite client = new PingClientSqllite();
					client.setRetries(2);
					try {
						System.out.println(client.ping());
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			});

			
			}	
		
		pool.shutdown();
	}
	



}
