import os
import tensorflow as tf
import MySQLdb.cursors
from tensorflow import keras
<<<<<<< HEAD:dummy/testing.py
from flask import Flask,jsonify
from flask_mysqldb import MySQL
from MySQLdb.cursors import DictCursor


=======
from flask import Flask, jsonify, send_from_directory
>>>>>>> be22638a60a3c17ab9a80a7a3b5f066661fccfed:app.py

app = Flask(__name__)
app.config['DEBUG'] = True


app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '1234'
app.config['MYSQL_DB'] = 'aera'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_PORT'] = '3306'  # Specify the port as a string

mysql = MySQLdb.connect(user=app.config['MYSQL_USER'],
                        passwd=app.config['MYSQL_PASSWORD'],
                        db=app.config['MYSQL_DB'],
                        host=app.config['MYSQL_HOST'],
                        port=int(app.config['MYSQL_PORT']))

# define the path to the tshirt folder
tshirt_folder = os.path.join(app.root_path, 'tshirt')

@app.route('/edit/<string:name>', methods=['GET'])
def getShirtList(name):
    # load the pre-trained model
    model = keras.models.load_model('keras_model.h5')
    # define the class labels
    class_labels = ['Short-Sleeve Shirt', 'Long-Sleeve Shirt', 'Skinny']
    img_name_list = []
<<<<<<< HEAD:dummy/testing.py

    
    for i in range(1, 8):
        img = keras.preprocessing.image.load_img(f'tshirt/{i}.png', target_size=(224, 224))
=======
    
    for i in range(1, 9):
        img_path = os.path.join(tshirt_folder, f'{i}.png')
        img = keras.preprocessing.image.load_img(img_path, target_size=(224, 224))

>>>>>>> be22638a60a3c17ab9a80a7a3b5f066661fccfed:app.py
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
            
<<<<<<< HEAD:dummy/testing.py
            
        
    return jsonify({'img_name_list': img_name_list})


@app.route('/type/<int:product_id>', methods=['GET'])
def getType(product_id):
    
    cursor = mysql.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute("SELECT product_no,product_type,price FROM product WHERE id = %s", (product_id,))
    product = cursor.fetchone()
    return jsonify(product)
   
    

if __name__ == '__main__':
    app.run(debug=True)







=======
    return jsonify({'img_name_list': img_name_list})

@app.route('/tshirt/<path:filename>')
def get_image(filename):
    return send_from_directory(tshirt_folder, filename)

if __name__ == '__main__':
    app.run(debug=True)
>>>>>>> be22638a60a3c17ab9a80a7a3b5f066661fccfed:app.py
