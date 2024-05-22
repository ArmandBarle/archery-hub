from app.models.user import User
from app import db


class UserService:
    def authenticate_user(self, email, password):
        user = User.query.filter_by(email=email).first()
        if user and user.check_password(password):
            return user
        return None

    def get_user_by_email(self, email):
        return User.query.filter_by(email=email).first()

    def create_user(self, first_name, last_name, email, phone_number, password, role_id):
        new_user = User(
            first_name=first_name,
            last_name=last_name,
            email=email,
            phone_number=phone_number,
            role_id=role_id
        )
        new_user.set_password(password)
        db.session.add(new_user)
        db.session.commit()
        return new_user
