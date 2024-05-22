from flask import Flask
from .register import register_bp
from .login import login_bp
from .arrows import arrows_bp
from .bows import bows_bp
from .olympic_ends import olympic_ends_bp
from .results import results_bp
from .events import events_bp
from .users import users_bp


def init_routes(app: Flask):
    app.register_blueprint(register_bp, url_prefix='/register')
    app.register_blueprint(login_bp, url_prefix='/login')
    app.register_blueprint(arrows_bp, url_prefix='/arrows')
    app.register_blueprint(bows_bp, url_prefix='/bows')
    app.register_blueprint(olympic_ends_bp, url_prefix='/olympic-end')
    app.register_blueprint(results_bp, url_prefix='/results')
    app.register_blueprint(events_bp, url_prefix='/events')
    app.register_blueprint(users_bp, url_prefix='/users')
