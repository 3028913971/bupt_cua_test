import sys
import os

import cv2
import Image
import numpy as np
from scipy.misc import imresize

caffe_root = "/home/ubuntu/caffe/"
sys.path.insert(0, os.path.join(caffe_root, "python"))
os.chdir(caffe_root)

import caffe


class ImageRecognizer(object):
    """Image recognizer."""

    def __init__(self, deploy_file=None, model_file=None, label_file=None, top_predictions_number=5):
        if deploy_file is None:
            self.__deploy_file = os.path.join(
                caffe_root, "models/placesCNN_upgraded/places205CNN_deploy_upgraded.prototxt")
        else:
            self.__deploy_file = deploy_file
        if model_file is None:
            self.__model_file = os.path.join(
                caffe_root, "models/placesCNN_upgraded/places205CNN_iter_300000_upgraded.caffemodel")
        else:
            self.__model_file = model_file
        if label_file is None:
            self.__label_file = os.path.join(
                caffe_root, "models/placesCNN_upgraded/categoryIndex_places205.csv")
        else:
            self.__label_file = label_file
        self.top_predictions_number = top_predictions_number
        self.__net = None
        self.__labels = None

    @staticmethod
    def __load_image(image_file):
        image = caffe.io.load_image(image_file)
        image = imresize(image, [227, 227])
        image = image.astype(np.uint8)
        return image

    def load_labels(self):
        self.__labels = np.loadtxt(self.__label_file, str, delimiter='\s')

    def create_net(self):
        self.__net = caffe.Net(self.__deploy_file, self.__model_file, caffe.TEST)

    def predict(self, image_file, device="cpu"):
        if device == "cpu":
            caffe.set_mode_cpu()
        elif device == "gpu":
            caffe.set_mode_gpu()
        else:
            # Unsupported device, use CPU instead.
            caffe.set_mode_cpu()
        image = ImageRecognizer.__load_image(image_file)
        out = self.__net.forward_all(data=np.asarray([image.transpose(2, 0, 1)]))
        top_k = self.__net.blobs['prob'].data[0].flatten().argsort()[-1: -(self.top_predictions_number + 1): -1]
        labels = self.__labels[top_k]
        scores = out['prob'][0][top_k]
        result = []
        for i in range(self.top_predictions_number):
            result.append("%s:%.5f" % (labels[i], scores[i]))
        return result


def main():
    pass


if __name__ == '__main__':
    main()
