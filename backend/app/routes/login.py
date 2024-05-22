from flask import Blueprint, request, jsonify
from app import db
from app.models.user import User

login_bp = Blueprint('login', __name__)


@login_bp.route('', methods=['POST'])
def login():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')

    user = User.query.filter_by(email=email).first()
    if user and user.check_password(password):
        # Here you would normally generate a token and return it
        return jsonify({'message': 'Logged in successfully'}), 200
    return jsonify({'message': 'Invalid credentials'}), 401
