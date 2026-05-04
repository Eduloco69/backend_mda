from flask import Blueprint, request
from app.controllers.auth_controller import register, login, logout, get_perfil
from shared.app.auth.middleware import auth_required

auth_bp = Blueprint("auth", __name__)

@auth_bp.route("/")
def ping():
    return "Conexión Ok"

@auth_bp.route("/register", methods=["POST"])
def register_route():
    return register()

@auth_bp.route("/login", methods=["POST"])
def login_route():
    return login()

@auth_bp.route("/perfil", methods=["GET"])
@auth_required
def perfil():
    return get_perfil()

@auth_bp.route("/logout", methods=["POST"])
def logout_route():
    return logout()

@auth_bp.route("/verify", methods=['GET'])
@auth_required
def verify():
    data = request.user
    return data