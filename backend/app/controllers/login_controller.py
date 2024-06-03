from flask import request, jsonify
from app.services.user_service import UserService
import jwt

class LoginController:
    @staticmethod
    def login():
        data = request.get_json()
        email = data.get('email')
        password = data.get('password')

        user = UserService().authenticate_user(email, password)

        if user:
            auth_token = user.set_auth_token()
            if auth_token:
                response = {
                    'auth_token': auth_token,
                    'message': 'Login successful',
                    'status': 'success'
                }
                return jsonify(response), 200
            else:
                return jsonify({'message': 'Login failed'}), 401

        return jsonify({'message': 'Invalid credentials'}), 401
