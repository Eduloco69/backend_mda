import os
from flask import Blueprint
from app.services.proxy_service import proxy_request

ticket_bp = Blueprint("ticket", __name__)

TICKET_SERVICE = os.getenv("TICKET_SERCIVE")

@ticket_bp.route("", methods=["POST"])
def crear():
    return proxy_request(f"{TICKET_SERVICE}/ticket")


@ticket_bp.route("", methods=["GET"])
def obtener():
    return proxy_request(f"{TICKET_SERVICE}/ticket")