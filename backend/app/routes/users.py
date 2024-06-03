from flask import Blueprint, request, jsonify
from jwt import ExpiredSignatureError

from app.controllers.user_controller import UserController
import  jwt
from app import config
users_bp = Blueprint('users', __name__)


def token_required(f):
    def decorated(*args, **kwargs):
        bearer = request.headers.get('Authorization')
        token = bearer.split()[1]
        if not token:
            return jsonify({'error': 'token is missing'}), 403
        try:
            jwt.decode(token, config.Config.SECRET_KEY, algorithms="HS256")
        except ExpiredSignatureError:
            return jsonify({'error': 'token is expired'}), 403
        except Exception as e:
            return jsonify({'error': e}), 403
        return f(*args, **kwargs)
    return decorated


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