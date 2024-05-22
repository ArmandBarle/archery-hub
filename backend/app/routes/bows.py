from flask import Blueprint
from app.controllers.bows_controller import BowsController

bows_bp = Blueprint('bows', __name__)

@bows_bp.route('/', methods=['POST'])
def create_bow():
    return BowsController.create_bow()

@bows_bp.route('/', methods=['GET'])
def get_bows():
    return BowsController.get_bows()

@bows_bp.route('/<int:bow_id>', methods=['GET'])
def get_bow(bow_id):
    return BowsController.get_bow(bow_id)

@bows_bp.route('/<int:bow_id>', methods=['DELETE'])
def delete_bow(bow_id):
    return BowsController.delete_bow(bow_id)
