from flask import request, jsonify
from app.services.arrows_service import ArrowsService

class ArrowsController:
    @staticmethod
    def add_arrow():
        data = request.get_json()
        new_arrow = ArrowsService.create_arrow(data)
        return jsonify({'message': 'Arrow added successfully', 'arrow': new_arrow.to_dict()}), 201

    @staticmethod
    def get_all_arrows():
        arrows = ArrowsService.get_all_arrows()
        return jsonify([arrow.to_dict() for arrow in arrows])

    @staticmethod
    def get_arrow(arrow_id):
        arrow = ArrowsService.get_arrow_by_id(arrow_id)
        if arrow:
            return jsonify(arrow.to_dict())
        return jsonify({'message': 'Arrow not found'}), 404

    @staticmethod
    def delete_arrow(arrow_id):
        success = ArrowsService.delete_arrow(arrow_id)
        if success:
            return jsonify({'message': 'Arrow deleted successfully'}), 200
        return jsonify({'message': 'Arrow not found'}), 404
