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
    img_name_list = []
    
    for i in range(1, 8):
        img = keras.preprocessing.image.load_img(f'tshirt/{i}.png', target_size=(224, 224))
        img_array = keras.preprocessing.image.img_to_array(img)
        img_array = tf.expand_dims(img_array, 0)
        img_array = keras.applications.mobilenet_v2.preprocess_input(img_array)

        # make predictions on the test image
        predictions = model.predict(img_array)
        predicted_class = class_labels[tf.argmax(predictions, axis=1)[0]]
        # Extracts Long sleeve shirts
        if  predicted_class == "Long-Sleeve Shirt" and name == "Long-Sleeve Shirt":
            print(predicted_class)
            img_name_list.append(f'{i}.png')
        # Extracts short sleeve shirts    
        elif predicted_class == "Short-Sleeve Shirt" and name == "Short-Sleeve Shirt":
            print(predicted_class)
            img_name_list.append(f'{i}.png')
            
        
    return jsonify({'img_name_list': img_name_list})

if __name__ == '__main__':
    app.run(debug=True)

