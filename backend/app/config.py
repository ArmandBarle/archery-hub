import os


class Config:
    SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL', 'postgresql://archery_user:new_password@localhost/archery_club')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = os.getenv('SECRET_KEY', 'my_secret_key')
        # \x1b\xc7\xa9\xf1j\xc4C\xb9}F\xd9Q\x91\x95PAn\xfa\xce\x15a\xc6\xd7\x11
