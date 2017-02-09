from suds.client import Client


def main():
    url = "http://%s:%s/%s?wsdl" % ("localhost", 9236, "HelloService")
    print(url)
    client = Client(url)
    print("Start client.")
    ret = client.service.hello("Bob")
    print(ret)


if __name__ == '__main__':
    main()
