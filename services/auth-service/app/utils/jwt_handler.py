import jwt
import datetime
import os

SECRET = os.getenv("JWT_SECRET", "secret123")

def generate_token(user):
    payload = {
        "userId": user["userId"],
        "email": user["userMail"],
        "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=8)
    }

    return jwt.encode(payload, SECRET, algorithm="HS256")

def verify_token(token):
    try:
        return jwt.decode(token, SECRET, algorithms=["HS256"])
    except:
        return None