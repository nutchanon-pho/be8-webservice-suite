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

    public override Object callout() {
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        req.setTimeout(timeout);
        req.setEndpoint(endpoint);
        for(String key : header.keySet()) {
            req.setHeader(key, header.get(key));
        }
        req.setMethod(method);
        req.setBody(body);
        return http.send(req);
    }
}
