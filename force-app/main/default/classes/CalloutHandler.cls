public abstract class CalloutHandler implements Calloutable {
    protected Integer timeout = 120000;
    protected String endpoint;
    protected CalloutResponseHandler handler;

    public CalloutHandler(String endpoint, CalloutResponseHandler handler) {
        this.endpoint = endpoint;
        this.handler = handler;
    }

    public void setTimeout(Integer timeout) {
        this.timeout = timeout;
    }
}
