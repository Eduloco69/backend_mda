from app.database.connection import get_connection
from app.utils.permisos import resolve_creation_mode
from app.utils.ticket_nro import generate_ticket_number
from app.utils.crear_ticket import build_payload, insert_ticket, save_attachments, insert_history, save_uploaded_file, update_ticket_number, insert_initial_message
from datetime import datetime
import math

def ver_tickets(userId, permisos, request):
    conn = get_connection()
    cursor = conn.cursor()

    estado = request.args.get("estado")
    asignado = request.args.get("asignado")
    categoria = request.args.get("categoria")
    subcategoria = request.args.get("subcategoria")
    prioridad = request.args.get("prioridad")
    nro_ticket = request.args.get("nroTicket")
    fecha_desde = request.args.get("fechaDesde")
    fecha_hasta = request.args.get("fechaHasta")
    pagina = int(request.args.get("pagina", 1))

    where_conditions = []
    params = []

    if estado:
        where_conditions.append("estadoTicket = ?")
        params.append(estado)
    
    if asignado:
        where_conditions.append("usuarioTicketAsignado = ?")
        params.append(asignado)

    if prioridad:
        where_conditions.append("prioridadTicket = ?")
        params.append(prioridad)

    if categoria:
        where_conditions.append("categoriaId = ?")
        params.append(categoria)

    if subcategoria:
        where_conditions.append("subCatId = ?")
        params.append(subcategoria)

    if nro_ticket:
        where_conditions.append("NroTicket LIKE ?")
        params.append(f"%{nro_ticket}%")

    if fecha_desde:
        where_conditions.append("fechaCreacionTicket >= ?")
        params.append(fecha_desde)

    if fecha_hasta:
        where_conditions.append("fechaCreacionTicket <= ?")
        params.append(fecha_hasta)

    if 'VER_TICKETS_TODOS' not in permisos:
        where_conditions.append("usuarioSolicitudTicket = ?")
        params.append(userId)
        
    where_clause = ""

    if where_conditions:
        where_clause = "WHERE " + " AND ".join(where_conditions)

    sql_total = f"""SELECT COUNT(*) as total 
                    FROM [MesaDeAyuda].[dbo].[v_lista_tickets]
                    {where_clause}"""

    sql_tickets = f"""SELECT * 
                        FROM [MesaDeAyuda].[dbo].[v_lista_tickets]
                        {where_clause}
                        ORDER BY fechaCreacionTicket DESC
                        OFFSET ? ROWS
                        FETCH NEXT 12 ROWS ONLY"""
        
    try:
        cursor.execute(sql_total, params)

        row = cursor.fetchone()
        total_tickets = int(row[0])
        total_paginas = math.ceil(total_tickets/12)

        offset = (pagina-1)*12

        cursor.execute(sql_tickets, *params, offset)

        columns = [column[0] for column in cursor.description]

        tickets = [
            dict(zip(columns, row))
            for row in cursor.fetchall()
        ]

        return {
            'Mensaje':'Tickets obtenidos correctamente',
            'tickets':tickets,
            'pagina_actual':pagina,
            'total_paginas':total_paginas
        }
    
    except Exception as e:
        return {
            'Mensaje':'Error al obtener los tickets',
            'Error':str(e)
            }, 400
    
def crear_tickets_service(user_id, permisos, data, files):

    mode = resolve_creation_mode(permisos)

    payload = build_payload(
        mode,
        user_id,
        data
    )

    print(payload)

    try:

        conn = get_connection()
        cursor = conn.cursor()

        ticket_id = insert_ticket(cursor, payload)
        nro_ticket = generate_ticket_number(ticket_id)
        update_ticket_number(cursor, ticket_id, nro_ticket)
        mensaje_id = insert_initial_message(cursor, ticket_id, payload["ticketDesc"], user_id)
        save_attachments(cursor, ticket_id, mensaje_id, user_id, files)
        insert_history(cursor, ticket_id, user_id)

        conn.commit()

        return {
            'Mensaje':'Ticket creado correctamente',
            'ticketId':ticket_id,
            'NroTicket':nro_ticket
        }
    except Exception as e:
        conn.rollback()
        return {
            'Mensaje':'Error creando Ticket', 
            'Error':str(e)
        }
    finally:
        cursor.close()
        conn.close()

def ver_detalle_ticket():
    return "hola"