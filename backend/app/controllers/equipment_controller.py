from flask import request, jsonify
from app.services.equipment_service import EquipmentSetService

class EquipmentController:
    @staticmethod
    def get_equipment_sets_by_user_id(user_id):
        equipment_sets = EquipmentSetService.get_all_equipment_sets_by_user_id(user_id)
        return jsonify([equipment_set.to_dict() for equipment_set in equipment_sets])

    @staticmethod
    def get_equipment_set_by_id(equipment_set_id):
        equipment_set = EquipmentSetService.get_equipment_set_by_id(equipment_set_id)
        if equipment_set:
            return jsonify(equipment_set.to_dict())
        return jsonify({'message': 'Equipment set not found'}), 404

    @staticmethod
    def delete_equipment_set(equipment_set_id):
        success = EquipmentSetService.delete_equipment_set(equipment_set_id)
        if success:
            return jsonify({'message': 'Equipment set deleted successfully'}), 200
        return jsonify({'message': 'Equipment set not found'}), 404

    @staticmethod
    def update_equipment_set(equipment_set_id):
        data = request.get_json()
        equipment_set = EquipmentSetService.update_equipment_set(equipment_set_id, data)
        if equipment_set:
            return jsonify(equipment_set.to_dict())
        return jsonify({'message': 'Equipment set not found'}), 404

    @staticmethod
    def create_equipment():
        data = request.get_json()
        new_equipment_set = EquipmentSetService.create_equipment_set(data)
        return jsonify(new_equipment_set.to_dict()), 201