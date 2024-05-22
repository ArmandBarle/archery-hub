from flask import Blueprint
from app.controllers.user_controller import UserController

users_bp = Blueprint('users', __name__)


@users_bp.route('', methods=['GET'])
def get_users():
    return UserController.get_users()


@users_bp.route('<user_id>', methods=['POST'])
def get_user(user_id):
    return UserController.get_user_by_id(user_id)


@users_bp.route('<user_id>', methods=['DELETE'])
def delete_user(user_id):
    return UserController.delete_user(user_id)


@users_bp.route('<user_id>', methods=['UPDATE'])
def update_user(user_id):
    return UserController.update_user(user_id)


@users_bp.route('/roles', methods=['GET'])
def get_user_roles():
    return UserController.get_user_roles()
