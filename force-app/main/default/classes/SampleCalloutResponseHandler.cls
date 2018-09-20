public class SampleCalloutResponseHandler extends CalloutResponseHandler {
    public override Object handleResponse(Object response) {
        HttpResponse httpResponse = (HttpResponse) response;
        System.debug(httpResponse.getBody());
        return null;
    }
}
