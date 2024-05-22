from flask import Blueprint
from app.controllers.olympic_end_controller import OlympicEndController

olympic_ends_bp = Blueprint('olympic_ends', __name__)


@olympic_ends_bp.route('', methods=['POST'])
def create_olympic_end():
    return OlympicEndController.create_olympic_end()


@olympic_ends_bp.route('/<event_id>', methods=['GET'])
def get_olympic_ends(event_id):
    return OlympicEndController.get_olympic_end(event_id)


@olympic_ends_bp.route('/<end_id>', methods=['DELETE'])
def delete_olympic_end(end_id):
    return OlympicEndController.delete_olympic_end(end_id)
