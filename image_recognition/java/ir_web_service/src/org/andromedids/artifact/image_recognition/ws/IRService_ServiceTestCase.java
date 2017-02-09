/**
 * IRService_ServiceTestCase.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.andromedids.artifact.image_recognition.ws;

public class IRService_ServiceTestCase extends junit.framework.TestCase {
    public IRService_ServiceTestCase(java.lang.String name) {
        super(name);
    }

    public void testIRServiceWSDL() throws Exception {
        javax.xml.rpc.ServiceFactory serviceFactory = javax.xml.rpc.ServiceFactory.newInstance();
        java.net.URL url = new java.net.URL(new org.andromedids.artifact.image_recognition.ws.IRService_ServiceLocator().getIRServiceAddress() + "?WSDL");
        javax.xml.rpc.Service service = serviceFactory.createService(url, new org.andromedids.artifact.image_recognition.ws.IRService_ServiceLocator().getServiceName());
        assertTrue(service != null);
    }

    public void test1IRServicePredict() throws Exception {
        org.andromedids.artifact.image_recognition.ws.IRService_BindingStub binding;
        try {
            binding = (org.andromedids.artifact.image_recognition.ws.IRService_BindingStub)
                          new org.andromedids.artifact.image_recognition.ws.IRService_ServiceLocator().getIRService();
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
        org.andromedids.artifact.image_recognition.ws.StringArray value = null;
        // Image file path should be absolute path.
        java.lang.String imageFilePath =
                new java.io.File("./data/images/cropped_panda.jpg").getAbsolutePath();
        value = binding.predict(imageFilePath, "/gpu:0");
        // TBD - validate results
        java.lang.String[] result = value.getString();
        for (java.lang.String string : result) {
            java.lang.System.out.println(string);
        }
    }

}
