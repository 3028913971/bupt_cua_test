from suds.client import Client


def main():
    url = "http://%s:%s/%s?wsdl" % ("localhost", 9236, "IRService/caffe")
    image_file = "E:\\project\\jetbrains\\pycharm\\image_recognition\\data\\images\\photos\\09.jpg"
    device = "cpu"
    print(url)
    client = Client(url)
    print("Start client.")
    ret = client.service.predict(image_file, device)
    print(ret)


if __name__ == '__main__':
    main()
