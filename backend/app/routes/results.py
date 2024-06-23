from flask import Blueprint

from app.controllers.result_controller import ResultsController

results_bp = Blueprint('results', __name__)

@results_bp.route('', methods=['POST'])
def add_result():
    return ResultsController.add_result()

@results_bp.route('<result_id>', methods=['DELETE'])
def delete_result(result_id):
    return ResultsController.delete_result(result_id)

@results_bp.route('', methods=['GET'])
def get_results():
    return ResultsController.get_all_results()

@results_bp.route('/event/<event_id>', methods=['GET'])
def get_results_by_event(event_id):
    return ResultsController.get_result_by_event_id(event_id)

@results_bp.route('<result_id>', methods=['PUT'])
def update_result(result_id):
    return ResultsController.update_result(result_id)

@results_bp.route('/user/<user_id>', methods=['GET'])
def get_results_by_user(user_id):
    return ResultsController.get_results_by_user_id(user_id)
