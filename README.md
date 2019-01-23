# BE8 Web Service Suite

# Installation
Please go to https://YOUR-DOMAIN.lightning.force.com/packagingSetupUI/ipLanding.app?apvId=04t0o000001X6qGAAS for installation.

# Motivation
The motivation for this web service suite is to create a generic service that could be utilize to perform web service callouts with lease dependencies and most reusability throughout any projects.

# Design
### `CalloutHandler` Abstract Class
A class called `CalloutHandler` is an abstract class with attributes of `endpoint`, `timeout` and `calloutResponseHandler`. These are the properties which should be required for any types of web service callouts. `CalloutHandler` is designed to be an abstract class with the implementation of `Calloutable` interface. To implement a specific type of a callout handler, one must extend `CalloutHandler` abstract class which could be seen in `RESTCalloutHandler` as an example. For more insight please see 'Supported Web Service' section.

### `Calloutable` Interface
This interface contains a method `callout()` which will perform the callout depending on those web services whether it is REST or SOAP. The class which implements this interface must specify the functionality of `callout()` to serve with the purposed type of web service. For example, `RESTCalloutHandler` implements the calling of REST web service inside `callout()` method.

### `ResponseHandleable` Interface
This interface is determined to be implemented for the implementation of `handleResponse(Object response)` method. The instances of these implemented class will be passed to the `CalloutHandler`. As a result, each `CalloutHandler` instance could have multiple ways of handling responses. The implemented classes will have the freedom to implement the handling of response from web service callouts. The method `handleResponse(Object response)` will be called after a complete web service callout.

# Supported Web Service
### 1. REST
REST Web Service will be executed using `RESTCalloutHandler` the caller of this class should supply `endpoint`, `CalloutResponseHandler` (optional), `header`, `body` and `method` to construct the class. Calling of `callout()` will execute the callout and if `CalloutResponseHandler` was supplied, it will be called.

### 2. SOAP
SOAP Web Service will be executed using `SOAPCalloutHandler` the caller of this class should supply `endpoint`, `CalloutResponseHandler` (optional), `header`, `body` and `soapAction` to construct the class. Calling of `callout()` will execute the callout and if `CalloutResponseHandler` was supplied, it will be called. Please noted that the implementation of this SOAP callout is done using String-based HTTP request with the header according to SOAP standard. The classes generated from WSDL2APEX will not be able to use `SOAPCalloutHandler`. The benefit of this approach is the freedom to generate the body of the callout. Some structure of XML might not be able to be replicated inside Apex. However, the limitation might occur when the size of the string body exceed heap size limit.

### 3. WSDL2APEX and other Web Service
Web services which are not mentioned above could be implemented by create new classes that extend `CalloutHandler` and override `callout()` to satisfy the requirements.

# Usage
### Sync Callout
```Java
RESTCalloutHandler sampleRESTCallout = new RESTCalloutHandler('https://long-running.herokuapp.com/products/1?latency=1', new SampleCalloutResponseHandler(), null, RESTCalloutHandler.GET, null);
sampleRESTCallout.callout();
```
### Async Callout
```Java
RESTCalloutHandler r1 = new RESTCalloutHandler('https://long-running.herokuapp.com/products/1?latency=1', new SampleCalloutResponseHandler(), null, RESTCalloutHandler.GET, null);
RESTCalloutHandler r2 = new RESTCalloutHandler('https://long-running.herokuapp.com/products/2?latency=1', new SampleCalloutResponseHandler(), null, RESTCalloutHandler.GET, null);
CalloutQueueable cq = new CalloutQueueable(new List<CalloutHandler>{r1, r2});
System.enqueueJob(cq);
```
