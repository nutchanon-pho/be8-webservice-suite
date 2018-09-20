public abstract class CalloutHandler {
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

    public abstract Object callout();
}
