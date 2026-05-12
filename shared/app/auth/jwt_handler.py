import jwt
import datetime
import os

SECRET = os.getenv("JWT_SECRET", "secret123")

def generate_token(user):
    payload = {
        "userId": user["userId"],
        "email": user["userMail"],
        "permisos": user["permisos"],
        "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=8)
    }

    return jwt.encode(payload, SECRET, algorithm="HS256")

def verify_token(token):
    print("verificando")
    try:
        print(SECRET)
        return jwt.decode(token, SECRET, algorithms=["HS256"])
    except Exception as e:
        print("JWT ERROR:", type(e).__name__)
        print("JWT DETAIL:", str(e))
        return None