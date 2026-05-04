from flask import Blueprint, request
from app.controllers.ticket_controller import obtener_tickets
from shared.app.auth.middleware import auth_required

ticket_bp = Blueprint("ticket", __name__)

@ticket_bp.route("/")
def ping():
    return "Conexión Ok"

@ticket_bp.route("/obtener", methods=['GET'])
@auth_required
def get_tickets():
    return obtener_tickets()
