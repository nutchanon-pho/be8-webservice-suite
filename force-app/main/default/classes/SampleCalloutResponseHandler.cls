public class SampleCalloutResponseHandler implements ResponseHandleable {
    public Object handleResponse(Object response) {
        HttpResponse httpResponse = (HttpResponse) response;
        System.debug(httpResponse.getBody());
        return null;
    } 
}
