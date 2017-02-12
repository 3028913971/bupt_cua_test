/**
 * IRService_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.andromedids.artifact.image_recognition.ws;

public interface IRService_PortType extends java.rmi.Remote {

    /**
     * Classify an image.
     */
    public org.andromedids.artifact.image_recognition.ws.StringArray predict(java.lang.String image_file, java.lang.String device) throws java.rmi.RemoteException;
}
