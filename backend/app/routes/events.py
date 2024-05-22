from flask import Blueprint
from app.controllers.event_controller import EventController

events_bp = Blueprint('events', __name__)


@events_bp.route('', methods=['GET'])
def get_events():
    return EventController.get_all_events()


@events_bp.route('/<int:event_id>', methods=['GET'])
def get_event(event_id):
    return EventController.get_event_by_id(event_id)


@events_bp.route('', methods=['POST'])
def create_event():
    return EventController.create_event()


@events_bp.route('/<int:event_id>', methods=['DELETE'])
def delete_event(event_id):
    return EventController.delete_event(event_id)


@events_bp.route('/event_types', methods=['GET'])
def get_event_types():
    return EventController.get_event_types()

@events_bp.route('/int:event_id', methods=['PUT'])
def update_event(event_id):
    return EventController.update_event(event_id)
