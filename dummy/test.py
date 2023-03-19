
import tensorflow as tf
from tensorflow import keras


# load the pre-trained model
model = keras.models.load_model('keras_model.h5')
# data = np.ndarray(shape=(1,224,224,3), dtype=np.float32)

# with Image.open("path/to/image.jpg") as img:
# define the class labels
class_labels = ['Short-Sleeve Shirt', 'Long-Sleeve Shirt', 'Skinny']

#load the test image and preprocess it
img = keras.preprocessing.image.load_img('tshirt/198.jpg', target_size=(224, 224))
img_array = keras.preprocessing.image.img_to_array(img)
img_array = tf.expand_dims(img_array, 0)
img_array = keras.applications.mobilenet_v2.preprocess_input(img_array)

# make predictions on the test image
predictions = model.predict(img_array)
predicted_class = class_labels[tf.argmax(predictions, axis=1)[0]]

# print the predicted class
print('Predicted class:', predicted_class)

if predicted_class == "Long-Sleeve Shirt":
    img = tf.keras.preprocessing.image.load_img('tshirt/1.jpg',target_size=(500, 500))
    img.show();
