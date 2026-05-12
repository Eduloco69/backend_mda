import os
from flask import Flask
from flask_cors import CORS
from flask_socketio import SocketIO

ALLOWED_ORIGINS = os.getenv("FRONTEND_URL", "*").split(",")

socketio = SocketIO(
    cors_allowed_origins=ALLOWED_ORIGINS,
    async_mode="threading"
)

def create_app():

    app = Flask(__name__)

    CORS(app, origins=ALLOWED_ORIGINS, supports_credentials=True)

    socketio.init_app(
        app
    )

    return app