from flask import request, jsonify
from app.services.bows_service import BowsService


class BowsController:
    @staticmethod
    def create_bow():
        data = request.get_json()
        new_bow = BowsService.create_bow(data)
        return jsonify(new_bow.to_dict()), 201

    @staticmethod
    def get_bows():
        all_bows = BowsService.get_all_bows()
        return jsonify([bow.to_dict() for bow in all_bows]), 200

    @staticmethod
    def get_bow(bow_id):
        bow = BowsService.get_bow_by_id(bow_id)
        if bow:
            return jsonify(bow.to_dict()), 200
        return jsonify({'message': 'Bow not found'}), 404

    @staticmethod
    def delete_bow(bow_id):
        success = BowsService.delete_bow(bow_id)
        if success:
            return jsonify({'message': 'Bow deleted successfully'}), 200
        return jsonify({'message': 'Bow not found'}), 404
