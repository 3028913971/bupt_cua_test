package org.andromedids.artifact.image_recognition;

import org.andromedids.artifact.image_recognition.ws.IRService_BindingStub;
import org.andromedids.artifact.image_recognition.ws.IRService_ServiceLocator;
import org.andromedids.artifact.image_recognition.ws.StringArray;

import javax.xml.rpc.ServiceException;
import java.io.File;
import java.rmi.RemoteException;

/**
 * Image recognition using web service.
 * Created by DONYORIDOYODOYO on 2017/2/14.
 */
public class RemoteImageRecognizer {

    private IRService_BindingStub serviceBinding;

    public RemoteImageRecognizer() throws ServiceException {
        initialize(60000);
    }

    public RemoteImageRecognizer(int timeout) throws ServiceException {
        initialize(timeout);
    }

    private void initialize(int timeout) throws ServiceException {
        serviceBinding = (IRService_BindingStub)
                new IRService_ServiceLocator().getIRService();
        if (serviceBinding == null) {
            throw new RuntimeException("Cannot get image recognition service.");
        }
        // Time out after a minute
        serviceBinding.setTimeout(timeout);
    }

    public PredictResult[] predict(String imageFile) throws RemoteException {
        return predict(imageFile, "cpu");
    }

    public PredictResult[] predict(String imageFile, String device) throws RemoteException {
        // Image file path should be absolute path.
        String imageFilePath = new File(imageFile).getAbsolutePath();
        StringArray value = serviceBinding.predict(imageFilePath, device);
        String[] results = value.getString();
        PredictResult[] predictResults = new PredictResult[results.length];
        for (int i = 0, n = results.length; i < n; ++i) {
            predictResults[i] = new PredictResult(results[i]);
        }
        return predictResults;
    }

    public static void main(String[] args) {
        try {
            RemoteImageRecognizer recognizer = new RemoteImageRecognizer();
            String imageFile = "./data/images/cropped_panda.jpg";
            PredictResult[] results = recognizer.predict(imageFile);
            System.out.println("Result:");
            for (PredictResult result : results) {
                System.out.println(result);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
