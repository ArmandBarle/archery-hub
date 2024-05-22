from flask import Flask
from .register import register_bp
from .login import login_bp


def init_routes(app: Flask):
    app.register_blueprint(register_bp, url_prefix='/register')
    app.register_blueprint(login_bp, url_prefix='/login')
