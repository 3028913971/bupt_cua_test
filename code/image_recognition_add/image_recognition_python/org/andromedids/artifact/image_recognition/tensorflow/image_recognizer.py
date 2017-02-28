import os
import sys
import tarfile
from urllib import request

import numpy as np
import tensorflow as tf
from tensorflow.models.image.imagenet.classify_image import DATA_URL

from org.andromedids.artifact.image_recognition.tensorflow import human_label_converter as hlc

PB_FILENAME = "classify_image_graph_def.pb"


class ImageRecognizer(object):
    """Image recognizer."""

    def __init__(self, model_dir=None, top_predictions_number=5):
        if model_dir is None:
            self.__model_dir = "./tensorflow_model"
        else:
            self.__model_dir = model_dir
        self.top_predictions_number = top_predictions_number
        self.__label_converter = hlc.HumanLabelConverter(self.__model_dir)

    def __is_model_existed(self):
        """Returns True if model is existed."""
        if not os.path.exists(self.__model_dir):
            return False
        necessary_files = [PB_FILENAME, hlc.LABEL_MAP_FILENAME, hlc.HUMAN_LABEL_MAP_FILENAME]
        for filename in necessary_files:
            if not os.path.exists(os.path.join(self.__model_dir, filename)):
                return False
        return True

    def download_model_if_necessary(self):
        """Download (if needed) and extract model tar file."""
        if self.__is_model_existed():
            print("Model is existed.")
            return
        if not os.path.exists(self.__model_dir):
            os.makedirs(self.__model_dir)
        filename = DATA_URL.split('/')[-1]
        file_path = os.path.join(self.__model_dir, filename)
        if not os.path.exists(file_path):
            def __process(count, block_size, total_size):
                sys.stdout.write("\r>> Downloading %s %.1f%%" % (
                    filename, float(count * block_size) / float(total_size) * 100.0))
                sys.stdout.flush()

            file_path, _ = request.urlretrieve(DATA_URL, file_path, __process)
            print()
            stat_info = os.stat(file_path)
            print("Successfully downloaded the model gz file",
                  filename, stat_info.st_size, " bytes.")
        else:
            print("Model gz file is existed.")
        print("Extract gz file...")
        tarfile.open(file_path, "r:gz").extractall(self.__model_dir)

    def load_human_label(self):
        """Loads human readable labels."""
        self.__label_converter.load()

    def create_graph(self):
        """Creates a graph from saved GraphDef file."""
        # Creates graph from saved graph_def.pb.
        with tf.gfile.FastGFile(os.path.join(
                self.__model_dir, "classify_image_graph_def.pb"), "rb") as f:
            graph_def = tf.GraphDef()
            graph_def.ParseFromString(f.read())
            _ = tf.import_graph_def(graph_def, name="")

    def predict(self, image_file, device="/cpu:0"):
        """Classify an image."""
        if not tf.gfile.Exists(image_file):
            tf.logging.fatal("File, %s, does not exist.", image_file)
        image_data = tf.gfile.FastGFile(image_file, "rb").read()
        result = []
        with tf.Session() as sess:
            # Some useful tensors:
            # 'softmax:0': A tensor containing the normalized prediction across
            #   1000 labels.
            # 'pool_3:0': A tensor containing the next-to-last layer containing 2048
            #   float description of the image.
            # 'DecodeJpeg/contents:0': A tensor containing a string providing JPEG
            #   encoding of the image.
            # Runs the softmax tensor by feeding the image_data as input to the graph.
            with tf.device(device):
                softmax_tensor = sess.graph.get_tensor_by_name("softmax:0")
                predictions = sess.run(softmax_tensor, {"DecodeJpeg/contents:0": image_data})
                predictions = np.squeeze(predictions)

                top_k = predictions.argsort()[-self.top_predictions_number:][::-1]
                for node_id in top_k:
                    human_string = self.__label_converter.id_to_human_string(node_id)
                    score = predictions[node_id]
                    result.append("%s:%.5f" % (human_string, score))
        return result


def __debug_test_accuracy():
    # Just for Debug.
    my_model_dir = "E:\\project\\jetbrains\\pycharm\\tensorflow\\imagenet_data"
    test_dir = "E:\\project\\jetbrains\\pycharm\\tensorflow\\image_recognition\\test_data"
    test_photo_dir = os.path.join(test_dir, "photos")
    test_park_dir = os.path.join(test_dir, "parks")
    test_prairie_dir = os.path.join(test_dir, "prairie")
    recognizer = ImageRecognizer(model_dir=my_model_dir)
    print("0 - Panda:")
    print(recognizer.predict(os.path.join(my_model_dir, "cropped_panda.jpg")))
    print()
    print("01 - Tree:")
    print(recognizer.predict(os.path.join(test_photo_dir, "01.jpg")))
    print()
    print("05 - Clock:")
    print(recognizer.predict(os.path.join(test_photo_dir, "05.jpg")))
    print()
    print("09 - Car:")
    print(recognizer.predict(os.path.join(test_photo_dir, "09.jpg")))
    print()
    print("n08494231_971.jpg - Park:")
    print(recognizer.predict(os.path.join(test_park_dir, "n08494231_971.jpg")))
    print()
    print("n08598301_562.JPEG - Prairie:")
    print(recognizer.predict(os.path.join(test_prairie_dir, "n08598301_562.JPEG")))
    print()
    # Test result: SAD!


def main():
    __debug_test_accuracy()


if __name__ == '__main__':
    main()
