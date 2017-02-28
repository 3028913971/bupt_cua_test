from os import path
import re

import tensorflow as tf

LABEL_MAP_FILENAME = "imagenet_2012_challenge_label_map_proto.pbtxt"
HUMAN_LABEL_MAP_FILENAME = "imagenet_synset_to_human_label_map.txt"


class HumanLabelConverter(object):
    """Converts integer node ID to human readable labels."""

    def __init__(self, data_dir=None):
        if data_dir is None:
            self.__data_dir = "./tensorflow_model"
        else:
            self.__data_dir = data_dir
        self.__dictionary = None

    def load(self):
        """Loads a human readable English name for each softmax node."""
        label_lookup_path = path.join(self.__data_dir, LABEL_MAP_FILENAME)
        uid_lookup_path = path.join(self.__data_dir, HUMAN_LABEL_MAP_FILENAME)
        if not tf.gfile.Exists(label_lookup_path):
            tf.logging.fatal("File, %s, does not exist" % label_lookup_path)
        if not tf.gfile.Exists(uid_lookup_path):
            tf.logging.fatal("File, %s, does not exist" % uid_lookup_path)

        # Loads mapping from string UID to integer node ID.
        node_id_to_uid = {}
        proto_as_ascii_lines = tf.gfile.GFile(label_lookup_path).readlines()
        target_class = None
        for line in proto_as_ascii_lines:
            if line.startswith("  target_class:"):
                target_class = int(line.split(": ")[1])
            if line.startswith("  target_class_string:"):
                if target_class is None:
                    tf.logging.fatal("File, %s, corrupted." % label_lookup_path)
                target_class_string = line.split(": ")[1]
                node_id_to_uid[target_class] = target_class_string[1: -2]
                target_class = None

        # Loads mapping from string UID to human-readable string.
        proto_as_ascii_lines = tf.gfile.GFile(uid_lookup_path).readlines()
        uid_to_human = {}
        p = re.compile(r'[n\d]*[ \S,]*')
        for line in proto_as_ascii_lines:
            parsed_items = p.findall(line)
            uid = parsed_items[0]
            human_string = parsed_items[2]
            uid_to_human[uid] = human_string

        # Loads the final mapping of integer node ID to human-readable string.
        node_id_to_name = {}
        for key, value in node_id_to_uid.items():
            if value not in uid_to_human:
                tf.logging.fatal("Failed to locate: %s", value)
            name = uid_to_human[value]
            node_id_to_name[key] = name

        self.__dictionary = node_id_to_name

    def id_to_human_string(self, node_id):
        if node_id not in self.__dictionary:
            return ""
        return self.__dictionary[node_id]


if __name__ == '__main__':
    print("Label map file: %s" % LABEL_MAP_FILENAME)
    print("Human label map file: %s" % HUMAN_LABEL_MAP_FILENAME)
