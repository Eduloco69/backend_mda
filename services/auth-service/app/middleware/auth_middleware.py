from flask import request
from app.utils.jwt_handler import verify_token

def auth_required(func):
    def wrapper(*args, **kwargs):
        token = request.cookies.get("access_token")

        if not token:
            return {"error": "No autenticado"}, 401

        data = verify_token(token)

        if not data:
            return {"error": "Token inválido"}, 401

        request.user = data
        return func(*args, **kwargs)

    return wrapper