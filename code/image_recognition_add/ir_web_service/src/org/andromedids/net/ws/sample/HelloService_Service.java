/**
 * HelloService_Service.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.andromedids.net.ws.sample;

public interface HelloService_Service extends javax.xml.rpc.Service {
    public java.lang.String getHelloServiceAddress();

    public org.andromedids.net.ws.sample.HelloService_PortType getHelloService() throws javax.xml.rpc.ServiceException;

    public org.andromedids.net.ws.sample.HelloService_PortType getHelloService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
