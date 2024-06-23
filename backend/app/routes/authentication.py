from flask import Blueprint
from app.decorators import token_required

auth_bp = Blueprint('auth', __name__)


@auth_bp.route('/validate_token', methods=['GET'])
# @token_required
def validate_token():
    return {'message': 'Token is valid','valid': 'true'}, 200