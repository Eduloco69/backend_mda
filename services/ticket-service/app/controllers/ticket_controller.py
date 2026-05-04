from flask import request, jsonify
from app.services.ticket_service import *

def obtener_tickets():
    data = request.user
    userId = data.get("userId")
    permisos = data.get("permisos", [])
    tickets = ver_tickets(userId, permisos, request)

    return jsonify(tickets)      