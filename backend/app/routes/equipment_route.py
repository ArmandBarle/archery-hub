from flask import Blueprint

from app.controllers.equipment_controller import EquipmentController

equipment_bp = Blueprint('equipment', __name__)

@equipment_bp.route('/<user_id>', methods=['GET'])
def get_user_equipment(user_id):
    return EquipmentController.get_equipment_sets_by_user_id(user_id)

@equipment_bp.route('/', methods=['POST'])
def create_equipment():
    return EquipmentController.create_equipment()
