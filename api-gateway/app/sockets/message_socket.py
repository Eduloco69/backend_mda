import os
import socketio as socketio_client

from app import socketio

MESSAGE_SERVICE = os.getenv("MESSAGE_SERVICE")

message_client = socketio_client.Client()


@message_client.on("connect")
def on_connect():
    print("Conectado a message-service")


def init_message_socket():
    message_client.connect(MESSAGE_SERVICE)

@message_client.on("new_message")
def on_new_message(data):
    ticket_id = data.get("ticketId")
    room = f"ticket_{ticket_id}"
    print(f"✓ Reenviando new_message a room: {room}")  # ← confirma que llega
    socketio.emit("new_message", data, room=room)