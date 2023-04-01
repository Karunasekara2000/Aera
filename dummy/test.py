import tensorflow as tf
from tensorflow import keras
# import numpy as np
# import matplotlib.pyplot as plt

# load the pre-trained model
model = keras.models.load_model('keras_model.h5')
# data = np.ndarray(shape=(1,224,224,3), dtype=np.float32)

# with Image.open("path/to/image.jpg") as img:
# define the class labels
class_labels = ['Short-Sleeve Shirt', 'Long-Sleeve Shirt', 'Skinny']

# initialize a counter for the number of Long-Sleeve Shirt images displayed
num_displayed = 0

#load the test image and preprocess it
for i in range(1, 20):
    img = keras.preprocessing.image.load_img('tshirt/{}.jpg'.format(i), target_size=(224, 224))
    img_array = keras.preprocessing.image.img_to_array(img)
    img_array = tf.expand_dims(img_array, 0)
    img_array = keras.applications.mobilenet_v2.preprocess_input(img_array)

    # make predictions on the test image
    predictions = model.predict(img_array)
    predicted_class = class_labels[tf.argmax(predictions, axis=1)[0]]


    # print the predicted class
    print('Predicted class:', predicted_class)



    if predicted_class == "Long-Sleeve Shirt":
        # display the image
        # img.show()
        # num_displayed += 1
        # img = tf.keras.preprocessing.image.load_img('tshirt/1.jpg',target_size=(500, 500))
        # img.show()
        # display the image
        img.show()
        num_displayed += 1

            # exit the loop after displaying 7 Long-Sleeve Shirt images
    if predicted_class == "Short-Sleeve Shirt":
        num_displayed += 1
        print('xxx')