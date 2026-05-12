from flask_socketio import join_room
from app import socketio


@socketio.on("connect")
def on_connect():
    print("Gateway conectado")


@socketio.on("join_ticket")
def join_ticket(data):

    print("JOIN EVENT RECIBIDO")
    print(data)

    ticket_id = data["ticketId"]

    room = f"ticket_{ticket_id}"

    join_room(room)

    print(f"usuario unido a {room}")