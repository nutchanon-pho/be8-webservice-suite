@isTest
private class SOAPCalloutHandlerTest {
    @isTest static void test() {
        Test.setMock(HttpCalloutMock.class, new MockHTTPCallout());
        SOAPCalloutHandler c = new SOAPCalloutHandler('http://test.com', new SampleCalloutResponseHandler(), new Map<String, String>(), 'test', null);
        c.setTimeout(10);
        c.callout();
    }
}
