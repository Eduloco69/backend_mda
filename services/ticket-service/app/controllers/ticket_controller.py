from flask import request, jsonify
from app.services.ticket_service import *

def obtener_tickets():
    data = request.user
    user_id = data.get("userId")
    permisos = data.get("permisos", [])
    tickets = ver_tickets(user_id, permisos, request)

    return jsonify(tickets)

def crear_ticket():
    user_data = request.user
    user_id = user_data.get("userId")
    permisos = user_data.get("permisos", [])

    data = request.form.to_dict()
    files = request.files.getlist("files")

    return crear_tickets_service(user_id, permisos, data, files)


def obtener_detalle():
    user_data = request.user
    user_id = user_data.get('userId')
    permisos = user_data.get('permisos', [])

    return ""

    