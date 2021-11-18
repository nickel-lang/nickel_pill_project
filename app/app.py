#! /usr/bin/env python3

import json
from flask import Flask

app = Flask(__name__)
with open("./config.json", "r") as f:
    configuration = json.load(f)

@app.route("/")
def hello():
    return "Hello, World!"

def run(cfg):
    app.run(host=cfg["host"], port=cfg["port"])


if __name__ == "__main__":
    run(configuration)
