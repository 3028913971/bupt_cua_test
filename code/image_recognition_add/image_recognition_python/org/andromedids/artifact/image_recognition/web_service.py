from org.andromedids.artifact.image_recognition.caffe import ir_service as cirs
from org.andromedids.artifact.image_recognition.tensorflow import ir_service as tirs


def start_caffe_ir_service(host="localhost", port=9236,
                           deploy_file=None, model_file=None,
                           label_file=None, top_predictions_number=5):
    cirs.stop()
    cirs.CONFIG["host"] = host
    cirs.CONFIG["port"] = port
    cirs.init_recognizer(
        deploy_file=deploy_file,
        model_file=model_file,
        label_file=label_file,
        top_predictions_number=top_predictions_number)
    cirs.publish()


def stop_caffe_ir_service():
    cirs.stop()


def start_tensorflow_ir_service(host="localhost", port=9236,
                                model_dir=None, top_predictions_number=5):
    tirs.stop()
    tirs.CONFIG["host"] = host
    tirs.CONFIG["port"] = port
    tirs.init_recognizer(
        model_dir=model_dir,
        top_predictions_number=top_predictions_number)
    tirs.publish()


def stop_tensorflow_ir_service():
    tirs.stop()
