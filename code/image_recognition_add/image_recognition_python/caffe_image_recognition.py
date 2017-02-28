from org.andromedids.artifact import image_recognition as ir


def main():
    ir.start_caffe_ir_service()
    print('Press "entry" key to stop service.')
    input()
    ir.stop_caffe_ir_service()


if __name__ == '__main__':
    main()
