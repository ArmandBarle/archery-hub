from flask import request, jsonify
from app.services.user_service import UserService


class UserController:
    @staticmethod
    def get_users():
        users = UserService.get_all_users()
        return jsonify(users)

    @staticmethod
    def get_user_by_id(user_id):
        user = UserService.get_user_by_id(user_id)
        return jsonify(user)

    @staticmethod
    def update_user(user_id):
        data = request.get_json()
        user = UserService.update_user(user_id, data)
        return jsonify(user)

    @staticmethod
    def delete_user(user_id):
        success = UserService.delete_user(user_id)
        if success:
            return jsonify({'message': 'User deleted successfully'}), 200
        return jsonify({'message': 'User not found'}), 404

    @staticmethod
    def get_user_roles():
        roles = UserService.get_user_roles()
        return jsonify(roles)
