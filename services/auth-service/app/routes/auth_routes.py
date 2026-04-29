from flask import Blueprint, request
from app.controllers.auth_controller import register, login, logout
from app.middleware.auth_middleware import auth_required

auth_bp = Blueprint("auth", __name__)

@auth_bp.route("/")
def ping():
    return "Hola"

@auth_bp.route("/register", methods=["POST"])
def register_route():
    return register()

@auth_bp.route("/login", methods=["POST"])
def login_route():
    return login()

@auth_bp.route("/perfil", methods=["GET"])
@auth_required
def perfil():
    return {"user": request.user}

@auth_bp.route("/logout", methods=["POST"])
def logout_route():
    return logout()