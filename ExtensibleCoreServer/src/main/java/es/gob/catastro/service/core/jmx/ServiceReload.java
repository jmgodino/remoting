package es.gob.catastro.service.core.jmx;

public interface ServiceReload {

    String CORE = "serverCore";

    void reloadService(String serv);

    void stopService(String serv);

    void startService(String serv);

    String getServices();

}
