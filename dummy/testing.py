import tensorflow as tf
from tensorflow import keras
from flask import Flask

app = Flask(__name__)

@app.route('/edit/<string:name>', methods=['GET'])
def getShirtList(name):

    # load the pre-trained model
    model = keras.models.load_model('keras_model.h5')
    # define the class labels
    class_labels = ['Short-Sleeve Shirt', 'Long-Sleeve Shirt', 'Skinny']
    # num_displayed = 0
    img = keras.preprocessing.image.load_img('tshirt/2.jpg'.format(2), target_size=(224, 224))
    img_array = keras.preprocessing.image.img_to_array(img)
    img_array = tf.expand_dims(img_array, 0)
    img_array = keras.applications.mobilenet_v2.preprocess_input(img_array)

    # make predictions on the test image
    predictions = model.predict(img_array)
    predicted_class = class_labels[tf.argmax(predictions, axis=1)[0]]

    if predicted_class == name:

        # img.show()
        # num_displayed += 1
        return name

    # exit the loop after displaying 7 Long-Sleeve Shirt images
    if predicted_class != name:
        # num_displayed += 1
        print('xxx')
        return name





if __name__ == '__main__':
    app.run(debug=True)

