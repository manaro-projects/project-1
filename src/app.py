from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_word():
  return "<h1>Hello World</h1><br><p>My Name is Ahmed Elhgawy </p><br><p>And My Email is 'ahmedelhgawy182@gmail.com'</p><br><p>feel free to connect me</p>"

if __name__ == "__main__":
  app.run(debug=True, host='0.0.0.0')