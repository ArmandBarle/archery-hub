from flask import request, jsonify
from app.services.arrow_service import ArrowService

class ArrowsController:
    @staticmethod
    def add_arrow():
        data = request.get_json()
        new_arrow = ArrowService.create_arrow(data)
        return jsonify({'message': 'Arrow added successfully', 'arrow': new_arrow.to_dict()}), 201

    @staticmethod
    def get_all_arrows():
        arrows = ArrowService.get_all_arrows()
        return jsonify([arrow.to_dict() for arrow in arrows])

    @staticmethod
    def get_arrow(arrow_id):
        arrow = ArrowService.get_arrow_by_id(arrow_id)
        if arrow:
            return jsonify(arrow.to_dict())
        return jsonify({'message': 'Arrow not found'}), 404

    @staticmethod
    def delete_arrow(arrow_id):
        success = ArrowService.delete_arrow(arrow_id)
        if success:
            return jsonify({'message': 'Arrow deleted successfully'}), 200
        return jsonify({'message': 'Arrow not found'}), 404

    @staticmethod
    def update_arrow(arrow_id):
        data = request.get_json()
        arrow = ArrowService.update_arrow(arrow_id, data)
        return jsonify(arrow.to_dict())
