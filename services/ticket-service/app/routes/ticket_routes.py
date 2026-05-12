from flask import Blueprint, request
from app.controllers.ticket_controller import obtener_tickets, crear_ticket
from shared.app.auth.middleware import auth_required

ticket_bp = Blueprint("ticket", __name__)

@ticket_bp.route("/ping")
def ping():
    return "Conexión Ok"

@ticket_bp.route("/", methods=['GET'])
@auth_required
def get_tickets():
    return obtener_tickets()

@ticket_bp.route("/", methods=['POST'])
@auth_required
def post_ticket():
    return crear_ticket()

@ticket_bp.route("/detalle/<int:id>", methods=['GET'])
@auth_required
def get_detalle_ticket():
    return ""