import os
from app.utils.archivos import save_uploaded_file
from werkzeug.utils import secure_filename

UPLOAD_FOLDER = "/app/uploads"

def build_payload(mode,user_id,data):

    payload = dict(data)
    payload["usuarioTicketCreacion"] = user_id
    payload["solicitanteTicket"] = None


    if mode == "USUARIO":
        payload["usuarioSolicitudTicket"] = user_id
        payload["usuarioTicketAsignado"] = None


    elif mode == "TECNICO":
        payload["usuarioTicketAsignado"] = user_id

    elif mode == "ADMIN":
        pass


    return payload

def insert_ticket(cursor,p):

    sql = """
    INSERT INTO ticket
    (
        tituloTicket,
        ticketDesc,
        estadoTicket,
        tipoTicket,
        prioridadTicket,
        subcategoriaTicket,
        usuarioSolicitudTicket,
        solicitanteTicket,
        usuarioTicketCreacion,
        usuarioTicketAsignado,
        fechaActualizacionTicket
    )

    OUTPUT INSERTED.ticketId

    VALUES
    (
        ?,?,?,?,?,?,?,?,?,?,
        GETDATE()
    )
    """

    cursor.execute(
        sql,
        (
            p["tituloTicket"],
            p["ticketDesc"],
            1,
            p["tipoTicket"],
            p["prioridadTicket"],
            p["subcategoriaTicket"],
            p["usuarioSolicitudTicket"],
            p["solicitanteTicket"],
            p["usuarioTicketCreacion"],
            p["usuarioTicketAsignado"]
        )
    )

    row = cursor.fetchone()

    return row[0]

def update_ticket_number(cursor,ticket_id,nro):

    cursor.execute(
        """
        UPDATE ticket
        SET NroTicket = ?
        WHERE ticketId = ?
        """,
        (nro,ticket_id)
    )

def save_attachments(cursor,ticket_id,mensaje_id,user_id,files):

    for file in files:

        os.makedirs(
            UPLOAD_FOLDER,
            exist_ok=True
        )

        if file.filename == "":
            continue

        filename = secure_filename(file.filename)

        file_path = os.path.join(
            UPLOAD_FOLDER,
            filename
        )

        file.save(file_path)

        cursor.execute(
            """
            INSERT INTO adjunto (ticketId,mensajeId,nomArchivo,tipoArchivo,fechaArchivo,usuarioAdjunto) VALUES (?,?,?,?,GETDATE(),?)
            """,(ticket_id,mensaje_id,filename,filename.split(".")[-1],user_id)
        )

def insert_history(cursor,ticket_id,user_id):

    cursor.execute(
        """
        INSERT INTO historialTicket
        (
            ticketId,
            campoModificado,
            tipoDato,
            valorNuevo,
            usuarioCambio,
            fechaCambio
        )

        VALUES
        (
            ?,
            'CREACION',
            'SYSTEM',
            'Ticket creado',
            ?,
            GETDATE()
        )
        """,
        (ticket_id,user_id)
    )

def insert_initial_message(cursor,ticket_id,mensaje,user_id):

    sql = """
    INSERT INTO mensajesTicket (ticketId,mensaje,fechaMensaje,userMensaje)

    OUTPUT INSERTED.mensajeId

    VALUES (?,?,GETDATE(),?)
    """

    cursor.execute(sql,(ticket_id,mensaje,user_id))

    row = cursor.fetchone()

    return row[0]