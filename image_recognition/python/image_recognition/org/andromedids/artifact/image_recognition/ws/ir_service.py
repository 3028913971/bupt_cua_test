from spyne import ServiceBase, rpc
from spyne import Unicode, Array

from org.andromedids.artifact.image_recognition.tensorflow.image_recognizer import ImageRecognizer
from org.andromedids.net.ws import web_service_publisher


CONFIG = {"host": "localhost",
          "port": 9236,
          "model_dir": None,
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


def init_recognizer(model_dir):
    CONFIG["model_dir"] = model_dir
    global __recognizer
    __recognizer = ImageRecognizer(
        CONFIG["model_dir"], CONFIG["top_predictions_number"])
    __recognizer.download_model_if_necessary()
    __recognizer.load_human_label()


def publish():
    print("Publish service:")
    web_service_publisher.publish_with_soap11(
        [IRService], "org.andromedids/IRService", "IRService", CONFIG["host"], CONFIG["port"])
    print("Published successfully.")


def stop():
    print("Stop service:")
    web_service_publisher.stop(CONFIG["host"], CONFIG["port"])
    print("Stopped successfully.")


def main():
    # FIXME: Set your model directory:
    model_dir = "E:\\project\\jetbrains\\pycharm\\image_recognition\\data\\imagenet_data"
    init_recognizer(model_dir)
    publish()
    input()
    stop()


if __name__ == '__main__':
    main()
