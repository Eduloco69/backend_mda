from app import (create_app,socketio)

from app.routes.auth_routes import auth_bp
from app.routes.ticket_routes import ticket_bp
from app.routes.message_routes import message_bp
from app.sockets.gateway_socket import *
from app.sockets.message_socket import init_message_socket

app = create_app()

app.register_blueprint(auth_bp,url_prefix="/auth")
app.register_blueprint(ticket_bp,url_prefix="/ticket")
app.register_blueprint(message_bp,url_prefix="/message")

init_message_socket()

if __name__ == "__main__":

    socketio.run(
        app,
        host="0.0.0.0",
        port=5000,
        debug=True,
        allow_unsafe_werkzeug=True
    )