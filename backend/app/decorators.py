import jwt
from flask import request, jsonify
from jwt import ExpiredSignatureError

from app import config


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
