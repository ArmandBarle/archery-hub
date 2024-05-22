from flask import request, jsonify
from app.services.result_service import ResultService

class ResultsController:
    @staticmethod
    def add_result():
        data = request.get_json()
        new_result = ResultService.add_result(data)
        return jsonify(new_result.to_dict())

    @staticmethod
    def delete_result(result_id):
        success = ResultService.delete_result(result_id)
        if success:
            return jsonify({'message': 'Result deleted successfully'}), 200
        return jsonify({'message': 'Result not found'}), 404

    @staticmethod
    def get_all_results():
        results = ResultService.get_all_results()
        return jsonify([result.to_dict() for result in results])

    @staticmethod
    def get_result_by_event_id(event_id):
        result = ResultService.get_result_by_event_id(event_id)
        return jsonify(result.to_dict())

    @staticmethod
    def update_result(result_id):
        data = request.get_json()
        result = ResultService.update_result(result_id, data)
        return jsonify(result.to_dict())