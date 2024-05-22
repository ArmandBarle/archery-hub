from flask import request, jsonify
from app.services.user_service import UserService

class LoginController:
    @staticmethod
    def login():
        data = request.get_json()
        email = data.get('email')
        password = data.get('password')

        user_service = UserService()
        user = user_service.authenticate_user(email, password)

        if user:
            # Here you would normally generate a token and return it
            return jsonify({'message': 'Logged in successfully'}), 200
        return jsonify({'message': 'Invalid credentials'}), 401
