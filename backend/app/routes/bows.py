from flask import Blueprint, request, jsonify
from app import db
from app.models.bow import Bow

bows_bp = Blueprint('bows', __name__)
