import os
from werkzeug.utils import secure_filename


UPLOAD_FOLDER = "/app/uploads"


def save_attachments(
    files,
    ticket_id,
    mensaje_id
):
    os.makedirs(
        UPLOAD_FOLDER,
        exist_ok=True
    )

    saved_files = []


    for file in files:

        filename = secure_filename(
            file.filename
        )

        filepath = os.path.join(
            UPLOAD_FOLDER,
            filename
        )

        file.save(
            filepath
        )

        saved_files.append({
            "nombre": filename,
            "path": filepath
        })

    return saved_files