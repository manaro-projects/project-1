from flask import Flask, render_template
import os

app = Flask(__name__, template_folder=".")

@app.route('/')
def hello_world():
    return render_template('index.html')

@app.errorhandler(404)
def page_not_found(e):
    return render_template('error.html'), 404


if __name__ == "__main__":
  app.run(debug=False, host='0.0.0.0')