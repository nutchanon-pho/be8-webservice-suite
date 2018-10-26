public abstract class CalloutHandler implements Calloutable {
    protected Integer timeout = 120000;
    protected String endpoint;
    protected ResponseHandleable handler;

    public CalloutHandler(String endpoint, ResponseHandleable handler) {
        this.endpoint = endpoint;
        this.handler = handler;
    }

    public void setTimeout(Integer timeout) {
        this.timeout = timeout;
    }
}
