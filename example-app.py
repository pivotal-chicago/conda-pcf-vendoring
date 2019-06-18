"""Cloud Foundry test"""
import os

from flask import Flask

app = Flask(__name__)

port = int(os.getenv("VCAP_APP_PORT", "8099"))


@app.route('/')
def hello_world():
    return "Hello World!"


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=port)
