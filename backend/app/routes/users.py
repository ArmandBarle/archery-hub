from flask import Blueprint
from app.controllers.user_controller import UserController
from app.decorators import token_required

users_bp = Blueprint('users', __name__)


@users_bp.route('', methods=['GET'])
def get_users():
    return UserController.get_users()


@users_bp.route('<user_id>', methods=['GET'])
@token_required
def get_user(user_id):
    return UserController.get_user_by_id(user_id)


@users_bp.route('<user_id>', methods=['DELETE'])
def delete_user(user_id):
    return UserController.delete_user(user_id)


@users_bp.route('<user_id>', methods=['UPDATE'])
def update_user(user_id):
    return UserController.update_user(user_id)


# @users_bp.route('/roles', methods=['GET'])
# def get_user_roles():
#     return UserController.get_user_roles()

@users_bp.route('<user_email>', methods=['GET'])
def get_user_roles(user_email):
    return UserController.get_user_by_email(user_email)