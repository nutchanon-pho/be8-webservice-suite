public class SOAPCalloutHandler extends CalloutHandler {
    private Map<String, String> header;
    private String soapAction;
    private String body;

    public SOAPCalloutHandler(String endpoint, CalloutResponseHandler handler, Map<String, String> header, String soapAction, String body) {
        super(endpoint, handler);
        this.header = header;
        this.soapAction = soapAction;
        this.body = body;
    }

    public override Object callout() {
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        req.setTimeout(timeout);
        req.setEndpoint(endpoint);
        req.setHeader('Content-Type', 'text/xml;charset=utf-8');
        req.setHeader('Content-Length', '' + body.length());
        req.setHeader('soapAction', soapAction);
        req.setHeader('Accept', 'text/xml');
        req.setMethod('POST');
        for(String key : header.keySet()) {
            req.setHeader(key, header.get(key));
        }
        req.setBody(body);
        return http.send(req);
    }
}
