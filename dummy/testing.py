import tensorflow as tf
from tensorflow import keras
from flask import Flask,jsonify

app = Flask(__name__)

@app.route('/edit/<string:name>', methods=['GET'])
def getShirtList(name):
    # load the pre-trained model
    model = keras.models.load_model('keras_model.h5')
    # define the class labels
    class_labels = ['Short-Sleeve Shirt', 'Long-Sleeve Shirt', 'Skinny']
    img_array_list = []
    img_name_list = []
    
    for i in range(1, 30):
        # num_displayed = 0
        img = keras.preprocessing.image.load_img(f'tshirt/{i}.jpg', target_size=(224, 224))
        img_array = keras.preprocessing.image.img_to_array(img)
        img_array = tf.expand_dims(img_array, 0)
        img_array = keras.applications.mobilenet_v2.preprocess_input(img_array)

        # make predictions on the test image
        predictions = model.predict(img_array)
        predicted_class = class_labels[tf.argmax(predictions, axis=1)[0]]
        img_name_list.append(f'{i}.jpg')

        if predicted_class == "Long-Sleeve Shirt" == name:
            print(predicted_class)
            img_array_list.append(img_array.numpy().tolist())
            # return jsonify(img_array_list)
            return jsonify({'img_name_list': img_name_list})
            # return name

        elif "Short-Sleeve Shirt" == name:
            short_sleeve_array_list = []

            for i in range(1, 30):
                # load the image and preprocess it
                img = keras.preprocessing.image.load_img(f'tshirt/{i}.jpg', target_size=(224, 224))
                img_array = keras.preprocessing.image.img_to_array(img)
                img_array = tf.expand_dims(img_array, 0)
                img_array = keras.applications.mobilenet_v2.preprocess_input(img_array)
                short_sleeve_array_list.append(img_array.numpy().tolist())

                return jsonify({'img_name_list': img_name_list})

if __name__ == '__main__':
    app.run(debug=True)

