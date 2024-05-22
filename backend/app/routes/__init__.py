from flask import Flask
from .register import register_bp
from .login import login_bp
from .arrows import arrows_bp
from .bows import bows_bp


def init_routes(app: Flask):
    app.register_blueprint(register_bp, url_prefix='/register')
    app.register_blueprint(login_bp, url_prefix='/login')
    app.register_blueprint(arrows_bp, url_prefix='/arrows')
    app.register_blueprint(bows_bp, url_prefix='/bows')
