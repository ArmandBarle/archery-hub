from flask import Blueprint
from app.controllers.login_controller import LoginController

login_bp = Blueprint('login', __name__)


@login_bp.route('', methods=['POST'])
def login():
    return LoginController.login()
