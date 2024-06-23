from app.models.user import User
from app.models.role import Role
from app import db

class AuthenticationService:

    @staticmethod
    def authenticate_user(email, password):
        user = User.query.filter_by(email=email).first()
        if user and user.check_password(password):
            return user
        return None

    @staticmethod
    def is_logged_in(auth_token):
        user_id = User.decode_auth_token(auth_token)
        return user_id