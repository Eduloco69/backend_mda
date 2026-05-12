from flask import Flask
from flask_socketio import SocketIO

socketio = SocketIO(async_mode="threading", cors_allowed_origins="*")

def create_app():

    app = Flask(__name__)
    socketio.init_app(app)

    return app