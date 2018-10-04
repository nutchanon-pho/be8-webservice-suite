public class RESTCalloutHandler extends CalloutHandler {
    public static STRING GET = 'GET';
    public static String POST = 'POST';

    private Map<String, String> header;
    private String method;
    private String body;

    public RESTCalloutHandler(String endpoint, CalloutResponseHandler handler, Map<String, String> header, String method, String body) {
        super(endpoint, handler);
        this.header = header;
        this.method = method;
        this.body = body;
    }

    public Object callout() {
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        req.setTimeout(timeout);
        req.setEndpoint(endpoint);
        if(header != null) {
            for(String key : header.keySet()) {
                req.setHeader(key, header.get(key));
            }
        }
        req.setMethod(method);
        if(body != null) {
            req.setBody(body);
        }
        res = http.send(req);
        if(handler != null) {
            handler.handleResponse(res);
        }
        return res;
    }
}
