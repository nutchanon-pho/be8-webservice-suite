global class MockHTTPCallout implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        // Create a fake response.
        // Set response values, and 
        // return response.
        return new HttpResponse();
    }
}