@isTest
private class CalloutQueueableTest {
    @isTest static void test() {
        Test.setMock(HttpCalloutMock.class, new MockHTTPCallout());
        List<CalloutHandler> calloutHandlerList = new List<CalloutHandler> {new SOAPCalloutHandler('http://test.com', new SampleCalloutResponseHandler(), new Map<String, String>(), 'test', null)};
        System.enqueueJob(new CalloutQueueable(calloutHandlerList));
    }
}
