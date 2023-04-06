import os
import tensorflow as tf
from tensorflow import keras
from flask import Flask, jsonify, send_from_directory

app = Flask(__name__)

# define the path to the tshirt folder
tshirt_folder = os.path.join(app.root_path, 'tshirt')

@app.route('/edit/<string:name>', methods=['GET'])
def getShirtList(name):
    # load the pre-trained model
    model = keras.models.load_model('keras_model.h5')
    # define the class labels
    class_labels = ['Short-Sleeve Shirt', 'Long-Sleeve Shirt', 'Skinny']
    img_array_list = []
    img_name_list = []
    
    for i in range(1, 9):
        img_path = os.path.join(tshirt_folder, f'{i}.png')
        img = keras.preprocessing.image.load_img(img_path, target_size=(224, 224))

        img_array = keras.preprocessing.image.img_to_array(img)
        img_array = tf.expand_dims(img_array, 0)
        img_array = keras.applications.mobilenet_v2.preprocess_input(img_array)

        # make predictions on the test image
        predictions = model.predict(img_array)
        predicted_class = class_labels[tf.argmax(predictions, axis=1)[0]]

        if  predicted_class == "Long-Sleeve Shirt" and name == "Long-Sleeve Shirt":
            img_name_list.append(f'{i}.png')
        elif predicted_class == "Short-Sleeve Shirt" and name == "Short-Sleeve Shirt":
            img_name_list.append(f'{i}.png')
            
    return jsonify({'img_name_list': img_name_list})

@app.route('/tshirt/<path:filename>')
def get_image(filename):
    return send_from_directory(tshirt_folder, filename)

if __name__ == '__main__':
    app.run(debug=True)
