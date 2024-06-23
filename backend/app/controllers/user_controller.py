from flask import request, jsonify
from app.services.user_service import UserService


class UserController:
    @staticmethod
    def get_users():
        users = UserService.get_all_users()
        users_dict = [user.to_dict() for user in users]
        return jsonify(users_dict)

    @staticmethod
    def get_user_by_id(user_id):
        user = UserService.get_user_by_id(user_id)
        return jsonify(user.to_dict())

    @staticmethod
    def update_user(user_id):
        data = request.get_json()
        user = UserService.update_user(user_id, data)
        return jsonify(user)

    @staticmethod
    def delete_user(user_id):
        success = UserService.delete_user(user_id)
        if success:
            return jsonify({'message': 'User deleted successfully'}), 204
        return jsonify({'message': 'User not found'}), 404

    @staticmethod
    def get_user_roles():
        roles = UserService.get_user_roles()
        return jsonify(roles)

    @staticmethod
    def get_user_by_email(email):
        user = UserService.get_user_by_email(email)
        return jsonify(user.to_dict())
