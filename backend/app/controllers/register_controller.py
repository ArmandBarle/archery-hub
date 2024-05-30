from flask import request, jsonify
from app.services.user_service import UserService

class RegisterController:
    @staticmethod
    def register():
        data = request.get_json()
        first_name = data.get('first_name')
        last_name = data.get('last_name')
        email = data.get('email')
        phone_number = data.get('phone_number')
        password = data.get('password')

        user_service = UserService()
        existing_user = user_service.get_user_by_email(email)

        if existing_user:
            return jsonify({'message': 'User already exists'}), 400

        user_service.create_user(
            first_name=first_name,
            last_name=last_name,
            email=email,
            phone_number=phone_number,
            password=password,
            role_id=2  # Assuming a default role_id, adjust as necessary
        )

        return jsonify({'message': 'User registered successfully'}), 201
