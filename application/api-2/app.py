import flask
from flask import request, jsonify
import requests
import os 

app = flask.Flask(__name__)
app.config["DEBUG"] = True

# Create some test data for our catalog in the form of a list of dictionaries.

@app.route('/', methods=['GET'])
def home():
    return '''<h1>VLib - Online Library</h1>
                <p>A flask api implementation for book information.</p>'''


@app.route('/books', methods=['GET'])
def api_all():
    r = requests.get(os.environ['API_URL'] + '/api/v1/books/all')
    books = r.json()
    return jsonify(books)


if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)
