from object_detection.utils import visualization_utils as vis_util
from object_detection.utils import label_map_util
from object_detection.utils import ops as utils_ops
import object_detection
import numpy as np
import os
import six.moves.urllib as urllib
import sys
import tarfile
import tensorflow as tf
import zipfile

from distutils.version import StrictVersion
from collections import defaultdict
from io import StringIO
from matplotlib import pyplot as plt
from PIL import Image

import argparse
import cv2
import time

# This is needed since the notebook is stored in the object_detection folder.
sys.path.append("..")

if StrictVersion(tf.__version__) < StrictVersion('1.12.0'):
    raise ImportError(
        'Please upgrade your TensorFlow installation to v1.12.*.')


# What model to download.
MODEL_NAME = 'ssd_mobilenet_v1_coco_2018_01_28'
#MODEL_NAME = 'ssdlite_mobilenet_v2_coco_2018_05_09'
#MODEL_NAME = 'ssd_mobilenet_v1_coco_2017_11_17'
MODEL_FILE = MODEL_NAME + '.tar.gz'
DOWNLOAD_BASE = 'http://download.tensorflow.org/models/object_detection/'

# Path to frozen detection graph. This is the actual model that is used for the object detection.
PATH_TO_FROZEN_GRAPH = MODEL_NAME + '/frozen_inference_graph.pb'

# List of the strings that is used to add correct label for each box.
PATH_TO_LABELS = os.path.join('/data', 'mscoco_label_map.pbtxt')

opener = urllib.request.URLopener()
opener.retrieve(DOWNLOAD_BASE + MODEL_FILE, MODEL_FILE)
tar_file = tarfile.open(MODEL_FILE)
for file in tar_file.getmembers():
    file_name = os.path.basename(file.name)
    if 'frozen_inference_graph.pb' in file_name:
        tar_file.extract(file, os.getcwd())


detection_graph = tf.Graph()
with detection_graph.as_default():
    od_graph_def = tf.GraphDef()
    with tf.gfile.GFile(PATH_TO_FROZEN_GRAPH, 'rb') as fid:
        serialized_graph = fid.read()
        od_graph_def.ParseFromString(serialized_graph)
        tf.import_graph_def(od_graph_def, name='')

category_index = label_map_util.create_category_index_from_labelmap(
    PATH_TO_LABELS, use_display_name=True)


def load_image_into_numpy_array(image):
    #  (im_width, im_height) = image.size
    height, width, channels = image.shape
    image_np = np.array(np.asarray(image)).reshape(
        (height, width, channels)).astype(np.uint8)
    return image_np


def run_inferences(video_capture, graph):
    with graph.as_default():
        with tf.Session() as sess:
            # Get handles to input and output tensors
            ops = tf.get_default_graph().get_operations()
            all_tensor_names = {
                output.name for op in ops for output in op.outputs}
            tensor_dict = {}
            for key in [
                'num_detections', 'detection_boxes', 'detection_scores',
                'detection_classes', 'detection_masks'
            ]:
                tensor_name = key + ':0'
                if tensor_name in all_tensor_names:
                    tensor_dict[key] = tf.get_default_graph().get_tensor_by_name(
                        tensor_name)
            if 'detection_masks' in tensor_dict:
                # The following processing is only for single image
                detection_boxes = tf.squeeze(
                    tensor_dict['detection_boxes'], [0])
                detection_masks = tf.squeeze(
                    tensor_dict['detection_masks'], [0])
                # Reframe is required to translate mask from box coordinates to image coordinates and fit the image size.
                real_num_detection = tf.cast(
                    tensor_dict['num_detections'][0], tf.int32)
                detection_boxes = tf.slice(detection_boxes, [0, 0], [
                                           real_num_detection, -1])
                detection_masks = tf.slice(detection_masks, [0, 0, 0], [
                                           real_num_detection, -1, -1])
                detection_masks_reframed = utils_ops.reframe_box_masks_to_image_masks(
                    detection_masks, detection_boxes, image.shape[1], image.shape[2])
                detection_masks_reframed = tf.cast(
                    tf.greater(detection_masks_reframed, 0.5), tf.uint8)
                # Follow the convention by adding back the batch dimension
                tensor_dict['detection_masks'] = tf.expand_dims(
                    detection_masks_reframed, 0)
            image_tensor = tf.get_default_graph().get_tensor_by_name('image_tensor:0')

            if video_capture.isOpened():
                windowName = "CannyDemo"
                cv2.namedWindow(windowName, cv2.WINDOW_NORMAL)
                cv2.resizeWindow(windowName, 1280, 720)
                cv2.moveWindow(windowName, 0, 0)
                cv2.setWindowTitle(windowName, "Canny Edge Detection")
                showWindow = 3  # Show all stages
                showHelp = True
                font = cv2.FONT_HERSHEY_PLAIN
                helpText = "'Esc' to Quit, '1' for Camera Feed, '2' for Canny Detection, '3' for All Stages. '4' to hide help"
                edgeThreshold = 40
                showFullScreen = False
                while True:
                    # Check to see if the user closed the window
                    if cv2.getWindowProperty(windowName, 0) < 0:
                        # This will fail if the user closed the window; Nasties get printed to the console
                        break
                    ret_val, frame = video_capture.read()
                    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
                    blur = cv2.GaussianBlur(hsv, (7, 7), 1.5)
                    edges = cv2.Canny(blur, 0, edgeThreshold)
                    detect = frame.copy()

                    # the array based representation of the image will be used later in order to prepare the
                    # result image with boxes and labels on it.
                    image_np = load_image_into_numpy_array(frame)
                    # Expand dimensions since the model expects images to have shape: [1, None, None, 3]
                    image_np_expanded = np.expand_dims(image_np, axis=0)
                    # Actual detection.

                    output_dict = sess.run(tensor_dict, feed_dict={
                                           image_tensor: image_np_expanded})

                    # all outputs are float32 numpy arrays, so convert types as appropriate
                    output_dict['num_detections'] = int(
                        output_dict['num_detections'][0])
                    output_dict['detection_classes'] = output_dict[
                        'detection_classes'][0].astype(np.uint8)
                    output_dict['detection_boxes'] = output_dict['detection_boxes'][0]
                    output_dict['detection_scores'] = output_dict['detection_scores'][0]
                    if 'detection_masks' in output_dict:
                        output_dict['detection_masks'] = output_dict['detection_masks'][0]

                    # Visualization of the results of a detection.
                    vis_util.visualize_boxes_and_labels_on_image_array(
                        image_np,
                        output_dict['detection_boxes'],
                        output_dict['detection_classes'],
                        output_dict['detection_scores'],
                        category_index,
                        instance_masks=output_dict.get('detection_masks'),
                        use_normalized_coordinates=True,
                        line_thickness=8)

                    if showWindow == 3:  # Need to show the 4 stages
                        # Composite the 2x2 window
                        # Feed from the camera is RGB, the others gray
                        # To composite, convert gray images to color.
                        # All images must be of the same type to display in a window
                        frameRs = cv2.resize(frame, (640, 360))
                        hsvRs = cv2.resize(hsv, (640, 360))
                        vidBuf = np.concatenate(
                            (frameRs, cv2.cvtColor(hsvRs, cv2.COLOR_GRAY2BGR)), axis=1)
                        blurRs = cv2.resize(blur, (640, 360))
                        detect = cv2.resize(image_np, (640, 360))
                        edgesRs = cv2.resize(edges, (640, 360))
                        #vidBuf1 = np.concatenate( (cv2.cvtColor(blurRs,cv2.COLOR_GRAY2BGR),cv2.cvtColor(edgesRs,cv2.COLOR_GRAY2BGR)), axis=1)
                        vidBuf1 = np.concatenate(
                            (detect, cv2.cvtColor(edgesRs, cv2.COLOR_GRAY2BGR)), axis=1)
                        vidBuf = np.concatenate((vidBuf, vidBuf1), axis=0)

                    if showWindow == 1:  # Show Camera Frame
                        displayBuf = frame
                    elif showWindow == 2:  # Show Canny Edge Detection
                        displayBuf = edges
                    elif showWindow == 3:  # Show All Stages
                        displayBuf = vidBuf
                    elif showWindow == 5:
                        displayBuf = cv2.resize(image_np, (1280, 720))

                    if showHelp == True:
                        cv2.putText(displayBuf, helpText, (11, 20),
                                    font, 1.0, (32, 32, 32), 4, cv2.LINE_AA)
                        cv2.putText(displayBuf, helpText, (10, 20),
                                    font, 1.0, (240, 240, 240), 1, cv2.LINE_AA)
                    cv2.imshow(windowName, displayBuf)
                    key = cv2.waitKey(10)
                    if key == 27:  # Check for ESC key
                        cv2.destroyAllWindows()
                        break
                    elif key == 49:  # 1 key, show frame
                        cv2.setWindowTitle(windowName, "Camera Feed")
                        showWindow = 1
                    elif key == 50:  # 2 key, show Canny
                        cv2.setWindowTitle(windowName, "Canny Edge Detection")
                        showWindow = 2
                    elif key == 51:  # 3 key, show Stages
                        cv2.setWindowTitle(
                            windowName, "Camera, Gray scale, Gaussian Blur, Canny Edge Detection")
                        showWindow = 3
                    elif key == 52:  # 4 key, toggle help
                        showHelp = not showHelp
                    elif key == 53:
                        showWindow = 5
                    elif key == 44:  # , lower canny edge threshold
                        edgeThreshold = max(0, edgeThreshold-1)
                        print('Canny Edge Threshold Maximum: ', edgeThreshold)
                    elif key == 46:  # , raise canny edge threshold
                        edgeThreshold = edgeThreshold+1
                        print('Canny Edge Threshold Maximum: ', edgeThreshold)
                    elif key == 74:  # Toggle fullscreen; This is the F3 key on this particular keyboard
                        # Toggle full screen mode
                        if showFullScreen == False:
                            cv2.setWindowProperty(
                                windowName, cv2.WND_PROP_FULLSCREEN, cv2.WINDOW_FULLSCREEN)
                        else:
                            cv2.setWindowProperty(
                                windowName, cv2.WND_PROP_FULLSCREEN, cv2.WINDOW_NORMAL)
                        showFullScreen = not showFullScreen

            else:
                print("camera open failed")


def parse_cli_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--video_device", dest="video_device",
                        help="Video device # of USB webcam (/dev/video?) [0]",
                        default=0, type=int)
    arguments = parser.parse_args()
    return arguments


def open_camera_device(device_number):
    return cv2.VideoCapture(0)
    # return cv2.VideoCapture("v4l2src device=/dev/video{} ! queue ! videoconvert ! appsink".format(device_number))
    # return cv2.VideoCapture("v4l2src device=/dev/video{} num-buffers=-1 io-mode=4 ! queue ! videoconvert ! appsink".format(device_number))
    # return cv2.VideoCapture("v4l2src device=/dev/video{} ! queue ! videoconvert ! appsink".format(device_number))


# https://raw.githubusercontent.com/jetsonhacks/buildOpenCVTX2/master/Examples/cannyDetection.py
if __name__ == '__main__':
    arguments = parse_cli_args()
    print("Called with args:")
    print(arguments)
    print("OpenCV version: {}".format(cv2.__version__))
    print("Device Number:", arguments.video_device)
    video_capture = open_camera_device(arguments.video_device)
    run_inferences(video_capture, detection_graph)
    video_capture.release()
    cv2.destroyAllWindows()
