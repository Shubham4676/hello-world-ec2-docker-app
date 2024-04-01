from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hii from Python app, welcomeee !!!!"

if __name__ == "__main__":
    app.run(host='0.0.0.0')
