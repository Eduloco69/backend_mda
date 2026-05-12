from flask import Blueprint

from shared.app.auth.middleware import auth_required

from app.controllers.message_controller import get_messages, create_message

message_bp = Blueprint("message",__name__)

@message_bp.route("/<int:ticket_id>", methods=["GET"])
@auth_required
def obtener(ticket_id):
    return get_messages(ticket_id)

@message_bp.route("",methods=["POST"])
@auth_required
def crear():
    return create_message()

