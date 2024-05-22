from flask import request, jsonify
from app.services.olympic_end_service import OlympicEndService

class OlympicEndController:
    @staticmethod
    def get_olympic_end(end_id):
        olympic_end = OlympicEndService.get_all_olympic_ends_of_event(end_id)
        return jsonify(olympic_end)

    @staticmethod
    def create_olympic_end():
        data = request.get_json()
        olympic_end = OlympicEndService.create_olympic_end(data)
        return jsonify(olympic_end)

    @staticmethod
    def delete_olympic_end(end_id):
        olympic_end = OlympicEndService.delete_olympic_end(end_id)
        return jsonify(olympic_end)