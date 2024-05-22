from flask import Blueprint
from app.controllers.arrow_controller import ArrowsController

arrows_bp = Blueprint('arrows', __name__)

@arrows_bp.route('', methods=['POST'])
def add_arrow():
    return ArrowsController.add_arrow()

@arrows_bp.route('', methods=['GET'])
def get_all_arrows():
    return ArrowsController.get_all_arrows()

@arrows_bp.route('/<int:arrow_id>', methods=['GET'])
def get_arrow(arrow_id):
    return ArrowsController.get_arrow(arrow_id)

@arrows_bp.route('/<int:arrow_id>', methods=['DELETE'])
def delete_arrow(arrow_id):
    return ArrowsController.delete_arrow(arrow_id)

@arrows_bp.route('/<int:arrow_id>', methods=['PUT'])
def update_arrow(arrow_id):
    return ArrowsController.update_arrow(arrow_id)
