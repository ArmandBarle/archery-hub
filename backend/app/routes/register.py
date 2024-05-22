from flask import Blueprint
from app.controllers.register_controller import RegisterController

register_bp = Blueprint('register', __name__)

@register_bp.route('', methods=['POST'])
def register():
    return RegisterController.register()
