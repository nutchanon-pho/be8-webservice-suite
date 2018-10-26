public class SOAPCalloutHandler extends CalloutHandler {
    private Map<String, String> header;
    private String soapAction;
    private String body;

    public SOAPCalloutHandler(String endpoint, ResponseHandleable handler, Map<String, String> header, String soapAction, String body) {
        super(endpoint, handler);
        this.header = header;
        this.soapAction = soapAction;
        this.body = body;
    }

    public Object callout() {
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        req.setTimeout(timeout);
        req.setEndpoint(endpoint);
        req.setHeader('Content-Type', 'text/xml;charset=utf-8');
        req.setHeader('soapAction', soapAction);
        req.setHeader('Accept', 'text/xml');
        req.setMethod('POST');
        if(header != null) {
            for(String key : header.keySet()) {
                req.setHeader(key, header.get(key));
            }
        }
        if(body != null) {
            req.setBody(body);
            req.setHeader('Content-Length', '' + body.length());
        }
        res = http.send(req);
        if(handler != null) {
            handler.handleResponse(res);
        }
        return res;
    }
}
