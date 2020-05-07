import numpy as np
import cv2
import matplotlib.pyplot as plt
from io import BytesIO
from PIL import Image


def _get_img(img):
    with open("data/{}".format(img), "rb") as image:
        f = image.read()
        b = bytearray(f)
    return b


def imshow(arr):
    plt.imshow(arr, vmin=0, vmax=255, cmap='gray')
    plt.tight_layout()
    plt.show()


def _open_as_bytestream(img):
    return Image.open(BytesIO(img))


def _to_2d_array(byte_stream):
    arr = np.array(byte_stream)
    indices = np.dstack(np.indices(arr.shape[:2]))
    return np.concatenate((arr, indices), axis=-1)


def _resize_img(arr):
    width = 400
    height = 400
    return cv2.resize(arr, dsize=(width,height), interpolation=cv2.INTER_CUBIC)


def _salt_and_pepper(img):
    s_vs_p = 0.5
    amount = 0.05
    out = np.copy(img)

    # Salt mode
    num_salt = np.ceil(amount * img.size * s_vs_p)
    coords = [np.random.randint(0, i-1, int(num_salt))
              for i in img.shape]
    out[coords] = 1

    # Pepper mode
    num_pepper = np.ceil(amount * img.size * (1. - s_vs_p))
    coords = [np.random.randint(0, i - 1, int(num_pepper))
              for i in img.shape]
    out[coords] = 0
    return out


def prepare_image(img_path)::imshow()
    """Convert an image byte stream to grayscale into an array and applies a Gaussian blur to reduce noise """
    img = cv2.imread("data/nebula.jpg")
    img = _resize_img(img)
    img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    img = _salt_and_pepper(img)
    imshow(img)
#    arr = gaussian(arr, sigma=3, preserve_range=True)
    return img
