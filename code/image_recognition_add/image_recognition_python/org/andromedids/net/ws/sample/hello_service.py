from spyne import ServiceBase, srpc
from spyne import Unicode

from org.andromedids.net.ws import web_service_publisher


class HelloService(ServiceBase):

    @srpc(Unicode, _returns=Unicode)
    def hello(name):
        return "Hello %s." % name


def main():
    my_host = "localhost"
    my_port = 9236
    print("Publish service:")
    web_service_publisher.publish_with_soap11(
        [HelloService], "org.andromedids/HelloService", "HelloService", my_host, my_port)
    print("Published successfully.")
    input()
    print("Stop service:")
    web_service_publisher.stop_all()
    print("Stopped successfully.")


if __name__ == '__main__':
    main()
