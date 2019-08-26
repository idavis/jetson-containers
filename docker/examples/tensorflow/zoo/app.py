# Code adapted from:
#     https://github.com/tensorflow/models/blob/master/research/object_detection/object_detection_tutorial.ipynb
# See THIRD-PARTY-NOTICES.TXT

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
from PIL import Image

import argparse
import cv2
import time

if StrictVersion(tf.__version__) < StrictVersion('1.12.0'):
    raise ImportError(
        'Please upgrade your TensorFlow installation to v1.12.*.')


# What model to download.
#MODEL_NAME = 'ssd_mobilenet_v1_coco_2018_01_28'
MODEL_NAME = 'ssd_mobilenet_v1_ppn_shared_box_predictor_300x300_coco14_sync_2018_07_03'
#MODEL_NAME = 'ssd_mobilenet_v1_0.75_depth_300x300_coco14_sync_2018_07_03'
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
                windowName = "Jetson TensorFlow Demo"
                cv2.namedWindow(windowName, cv2.WINDOW_NORMAL)
                cv2.resizeWindow(windowName, 1280, 720)
                cv2.moveWindow(windowName, 0, 0)
                cv2.setWindowTitle(windowName, "Jetson TensorFlow Demo")
                font = cv2.FONT_HERSHEY_PLAIN
                showFullScreen = False
                while True:
                    # Check to see if the user closed the window
                    if cv2.getWindowProperty(windowName, 0) < 0:
                        # This will fail if the user closed the window;
                        break
                    ret_val, frame = video_capture.read()

                    # the array based representation of the image will be used later in order to prepare the
                    # result image with boxes and labels on it.
                    image_np = load_image_into_numpy_array(frame)
                    # Expand dimensions since the model expects images to have shape: [1, None, None, 3]
                    image_np_expanded = np.expand_dims(image_np, axis=0)
                    # Actual detection.

                    output_dict = sess.run(tensor_dict, feed_dict={
                                           image_tensor: image_np_expanded})

                    # all outputs are float32 numpy arrays, so convert types as appropriate
                    output_dict['num_detections'] = int(output_dict['num_detections'][0])
                    output_dict['detection_classes'] = output_dict['detection_classes'][0].astype(np.uint8)
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

                    displayBuf = cv2.resize(image_np, (1280, 720))

                    cv2.imshow(windowName, displayBuf)
                    key = cv2.waitKey(10)
                    if key == -1:
                        break
                    elif key == 27:
                        cv2.destroyAllWindows()
                        break
                    elif key == ord('f'):
                        if showFullScreen == False:
                            cv2.setWindowProperty(
                                windowName, cv2.WND_PROP_FULLSCREEN, cv2.WINDOW_FULLSCREEN)
                        else:
                            cv2.setWindowProperty(
                                windowName, cv2.WND_PROP_FULLSCREEN, cv2.WINDOW_NORMAL)
                        showFullScreen = not showFullScreen

            else:
                print("Failed to open the camera.")


def parse_cli_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--video_device", dest="video_device",
                        help="Video device # of USB webcam (/dev/video?) [0]",
                        default=0, type=int)
    arguments = parser.parse_args()
    return arguments


def open_camera_device(device_number):
    device_number = 0
#    return cv2.VideoCapture(0)
    #return cv2.VideoCapture("v4l2src device=/dev/video{} ! queue ! videoconvert ! appsink".format(device_number))
    #return cv2.VideoCapture("v4l2src device=/dev/video{} num-buffers=-1 io-mode=4 ! queue ! videoconvert ! appsink".format(device_number))
    return cv2.VideoCapture("v4l2src device=/dev/video{} num-buffers=-1 ! queue ! videoconvert ! appsink".format(device_number))
    # return cv2.VideoCapture("v4l2src device=/dev/video{} ! queue ! videoconvert ! appsink".format(device_number))


# https://raw.githubusercontent.com/jetsonhacks/buildOpenCVTX2/master/Examples/cannyDetection.py
if __name__ == '__main__':
    arguments = parse_cli_args()
    print("Called with args:")
    print(arguments)
    print("OpenCV version: {}".format(cv2.__version__))
    print("Device Number:", arguments.video_device)
    video_capture = open_camera_device(arguments.video_device)
    video_capture.read()
    run_inferences(video_capture, detection_graph)
    video_capture.release()
    cv2.destroyAllWindows()
