/**
 * HelloService_ServiceTestCase.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.andromedids.net.ws.sample;

public class HelloService_ServiceTestCase extends junit.framework.TestCase {
    public HelloService_ServiceTestCase(java.lang.String name) {
        super(name);
    }

    public void testHelloServiceWSDL() throws Exception {
        javax.xml.rpc.ServiceFactory serviceFactory = javax.xml.rpc.ServiceFactory.newInstance();
        java.net.URL url = new java.net.URL(new org.andromedids.net.ws.sample.HelloService_ServiceLocator().getHelloServiceAddress() + "?WSDL");
        javax.xml.rpc.Service service = serviceFactory.createService(url, new org.andromedids.net.ws.sample.HelloService_ServiceLocator().getServiceName());
        assertTrue(service != null);
    }

    public void test1HelloServiceHello() throws Exception {
        org.andromedids.net.ws.sample.HelloService_BindingStub binding;
        try {
            binding = (org.andromedids.net.ws.sample.HelloService_BindingStub)
                          new org.andromedids.net.ws.sample.HelloService_ServiceLocator().getHelloService();
        }
        catch (javax.xml.rpc.ServiceException jre) {
            if(jre.getLinkedCause()!=null)
                jre.getLinkedCause().printStackTrace();
            throw new junit.framework.AssertionFailedError("JAX-RPC ServiceException caught: " + jre);
        }
        assertNotNull("binding is null", binding);

        // Time out after a minute
        binding.setTimeout(60000);

        // Test operation
        java.lang.String value = null;
        java.lang.String name = "Bob";
        value = binding.hello(name);
        // TBD - validate results
        java.lang.System.out.println(value);
    }

}
