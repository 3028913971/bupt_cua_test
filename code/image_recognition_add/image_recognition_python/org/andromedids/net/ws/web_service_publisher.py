import sys
import time

from itertools import count

from threading import Thread

from spyne import Application
from spyne.protocol.soap import Soap11, Soap12
from spyne.server.wsgi import WsgiApplication
from wsgiref.simple_server import make_server


__next = count().__next__
__publisher_dict = {}


def _new_name():
    return "WSPublisher-%d" % __next()


class _PublishThread(Thread):

    def __init__(self, server):
        Thread.__init__(self, name=_new_name())
        self.__server = server

    def run(self):
        self.__server.serve_forever()


class WebServicePublisher(object):

    __time_format = "%Y-%m-%d %H:%M:%S"

    def __init__(self, services, tns, name=None,
                 host=None, port=None,
                 event_handler_dict=None,
                 log_target=None):
        if host is None:
            host = "localhost"
        if port is None:
            port = 9236
        if log_target is None:
            log_target = sys.stderr
        self.__services = services
        self.__tns = tns
        self.__name = name
        self.__host = host
        self.__port = port
        self.__event_handler_dict = event_handler_dict
        self.__log_target = log_target
        self.__server = None
        self.__thread = None

    def __publish(self, soap_type):
        app = Application(self.__services, self.__tns, self.__name,
                          soap_type(validator="lxml"), soap_type())
        if self.__event_handler_dict is not None:
            for key, value in self.__event_handler_dict.items():
                app.event_manager.add_listener(key, value)
        wsgi_app = WsgiApplication(app)
        server = make_server(self.__host, self.__port, wsgi_app)
        self.__server = server
        self.__thread = _PublishThread(server)
        self.__thread.start()
        print("Service, %s, published at %s." %
              (self.__name, time.strftime(self.__time_format)),
              file=self.__log_target)

    def publish_with_soap11(self):
        self.__publish(Soap11)

    def publish_with_soap12(self):
        self.__publish(Soap12)

    def stop(self):
        if self.__server is not None:
            self.__server.shutdown()
            self.__server = None
        if self.__thread is not None:
            self.__thread.join()
            self.__thread = None
        print("Service, %s, stopped at %s." %
              (self.__name, time.strftime(self.__time_format)),
              file=self.__log_target)


def get_publisher(host, port):
    if (host, port) in __publisher_dict:
        return __publisher_dict[(host, port)]
    else:
        return None


def __make_new_publisher(services, tns, name, host, port,
                         event_handler_dict, log_target):
    if (host, port) in __publisher_dict:
        raise RuntimeError("%s:%s is using by a publisher." % (host, port))
    new_publisher = WebServicePublisher(
        services, tns, name=name, host=host, port=port,
        event_handler_dict=event_handler_dict, log_target=log_target)
    __publisher_dict[(host, port)] = new_publisher
    return new_publisher


def publish_with_soap11(services, tns, name, host, port,
                        event_handler_dict=None, log_target=sys.stderr):
    new_publisher = __make_new_publisher(
        services, tns, name, host, port, event_handler_dict, log_target)
    new_publisher.publish_with_soap11()


def publish_with_soap12(services, tns, name, host, port,
                        event_handler_dict=None, log_target=sys.stderr):
    new_publisher = __make_new_publisher(
        services, tns, name, host, port, event_handler_dict, log_target)
    new_publisher.publish_with_soap12()


def stop(host, port):
    publisher = __publisher_dict.pop((host, port))
    if publisher is not None:
        publisher.stop()


def stop_all():
    for publisher in __publisher_dict.values():
        publisher.stop()
    __publisher_dict.clear()
