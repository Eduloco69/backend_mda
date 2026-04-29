from app.database.connection import get_connection
import bcrypt
from app.utils.jwt_handler import generate_token

def register_user(data):
    conn = get_connection()
    cursor = conn.cursor()

    hashed_pw = bcrypt.hashpw(
        data["password"].encode(),
        bcrypt.gensalt()
    ).decode()

    try:

        cursor.execute("""
            INSERT INTO     [MesaDeAyuda].[dbo].[usuario] 
                            ([username], [userNom], [userApPat], [userApMat], 
                            [userMail], [userTelMovil], [userTelFijo], 
                            [departamentoId], [password], [rolId], [changePassFlg], [ActiveFlg]) 
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        """, (data["username"], data['userNom'], data['userApPat'], data['userApMat'], 
            data['userMail'], data["userTelMovil"], data["userTelFijo"], data['departamento'], 
            hashed_pw, data['rol'], 1, 1))

        conn.commit()

        return {"message": "Usuario creado"}
    
    except Exception as e:
        print(e)
        return {"error": str(e)}

def login_user(data):
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("SELECT userId, userMail, password FROM usuario WHERE userMail = ?", data["email"])
    row = cursor.fetchone()

    if not row:
        return {"error": "Usuario no existe"}, 404

    if not bcrypt.checkpw(data["password"].encode(), row[2].encode()):
        return {"error": "Credenciales inválidas"}, 401

    user = {
        "userId": row[0],
        "userMail": row[1]
    }

    token = generate_token(user)

    return {"token": token}