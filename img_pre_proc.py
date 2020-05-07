import numpy as np
import matplotlib.pyplot as plt
from io import BytesIO
from PIL import Image
from scipy.ndimage import gaussian_filter as gaussian
from skimage.filters import gaussian


def imshow(arr):
    plt.imshow(arr, vmin=0, vmax=255, cmap='gray')
    plt.tight_layout()
    plt.show()


def _open_as_bytestream(img):
    return Image.open(BytesIO(img))


def _to_grayscale(arr):
    img_bytes = _open_as_bytestream(arr)
    img_bytes = img_bytes.convert('L')
    return img_bytes


def _to_np_array(byte_stream):
    arr = np.array(byte_stream)
    return arr.astype(np.int16)


def _resize_img(arr):
    if arr.shape[0] < 400 or arr.shape[1] < 400:
        raise ValueError("Image must be at least 400x400 pixels.")
    width = 400
    height = 400
    x_start_point = (arr.shape[0] / 2) - (width / 2)
    y_start_point = (arr.shape[0] / 2) - (width / 2)
    return arr[x_start_point:, y_start_point:]


def _prepare_image(img):
    """Convert an image byte stream to grayscale into an array and applies a Gaussian blur to reduce noise """
    arr = _to_grayscale(img)
    arr = _to_np_array(arr)
    arr = _resize_img(arr)
    arr = gaussian(arr, sigma=3, preserve_range=True)
    arr = _to_np_array(arr)
    return arr
