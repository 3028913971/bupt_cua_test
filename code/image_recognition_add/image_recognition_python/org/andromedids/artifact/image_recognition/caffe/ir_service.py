from spyne import ServiceBase, rpc
from spyne import Unicode, Array

from org.andromedids.artifact.image_recognition.caffe.image_recognizer import ImageRecognizer
from org.andromedids.net.ws import web_service_publisher


CONFIG = {"host": "localhost",
          "port": 9236,
          "deploy_file": None,
          "model_file": None,
          "label_file": None,
          "top_predictions_number": 5}

__recognizer = None


def __on_method_call(ctx):
    ctx.udc = __recognizer


class IRService(ServiceBase):
    """Image recognition service."""

    @rpc(Unicode, Unicode, _returns=Array(Unicode))
    def predict(ctx, image_file, device):
        """Classify an image."""
        ctx.udc.create_graph()
        return ctx.udc.predict(image_file, device)


IRService.event_manager.add_listener("method_call", __on_method_call)


def init_recognizer(deploy_file=None, model_file=None, label_file=None, top_predictions_number=5):
    CONFIG["deploy_file"] = deploy_file
    CONFIG["model_file"] = model_file
    CONFIG["label_file"] = label_file
    CONFIG["top_predictions_number"] = top_predictions_number
    global __recognizer
    __recognizer = ImageRecognizer(
        CONFIG["deploy_file"], CONFIG["model_file"],
        CONFIG["label_file"], CONFIG["top_predictions_number"])
    __recognizer.load_labels()
    __recognizer.create_net()


def publish():
    print("Publish service:")
    web_service_publisher.publish_with_soap11(
        [IRService], "org.andromedids/IRService/caffe", "IRService-caffe", CONFIG["host"], CONFIG["port"])
    print("Published successfully.")


def stop():
    print("Stop service:")
    web_service_publisher.stop(CONFIG["host"], CONFIG["port"])
    print("Stopped successfully.")


def main():
    # FIXME: Set your model directory:
    init_recognizer()
    publish()
    input()
    stop()


if __name__ == '__main__':
    main()
