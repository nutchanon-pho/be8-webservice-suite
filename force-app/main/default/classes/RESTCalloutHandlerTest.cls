@isTest
private class RESTCalloutHandlerTest {
    @isTest static void test() {
        Test.setMock(HttpCalloutMock.class, new MockHTTPCallout());
        RESTCalloutHandler c = new RESTCalloutHandler('http://test.com', new SampleCalloutResponseHandler(), new Map<String, String>(), RESTCalloutHandler.GET, null);
        c.setTimeout(10);
        c.callout();
    }
}
