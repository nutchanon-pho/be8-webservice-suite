public class SampleRESTRequest implements IRESTRequest {
    public String getEndpoint() {
        return 'https://long-running.herokuapp.com/products/1?latency=1';
    }

    public String getHeader() {
        return null;
    }

    public String getMethod() {
        return 'GET';
    }

    public String getBody() {
        return null;
    }
}
