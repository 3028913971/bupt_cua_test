/**
 * IRService_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.andromedids.artifact.image_recognition.ws;

public class IRService_ServiceLocator extends org.apache.axis.client.Service implements org.andromedids.artifact.image_recognition.ws.IRService_Service {

    public IRService_ServiceLocator() {
    }


    public IRService_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public IRService_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for IRService
    private java.lang.String IRService_address = "http://localhost:9236/";

    public java.lang.String getIRServiceAddress() {
        return IRService_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String IRServiceWSDDServiceName = "IRService";

    public java.lang.String getIRServiceWSDDServiceName() {
        return IRServiceWSDDServiceName;
    }

    public void setIRServiceWSDDServiceName(java.lang.String name) {
        IRServiceWSDDServiceName = name;
    }

    public org.andromedids.artifact.image_recognition.ws.IRService_PortType getIRService() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(IRService_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getIRService(endpoint);
    }

    public org.andromedids.artifact.image_recognition.ws.IRService_PortType getIRService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            org.andromedids.artifact.image_recognition.ws.IRService_BindingStub _stub = new org.andromedids.artifact.image_recognition.ws.IRService_BindingStub(portAddress, this);
            _stub.setPortName(getIRServiceWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setIRServiceEndpointAddress(java.lang.String address) {
        IRService_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (org.andromedids.artifact.image_recognition.ws.IRService_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                org.andromedids.artifact.image_recognition.ws.IRService_BindingStub _stub = new org.andromedids.artifact.image_recognition.ws.IRService_BindingStub(new java.net.URL(IRService_address), this);
                _stub.setPortName(getIRServiceWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("IRService".equals(inputPortName)) {
            return getIRService();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("org.andromedids/IRService", "IRService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("org.andromedids/IRService", "IRService"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("IRService".equals(portName)) {
            setIRServiceEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
