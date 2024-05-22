from flask import Blueprint, request, jsonify
from app.services.event_service import EventService

class EventController:
    @staticmethod
    def get_all_events():
        return jsonify(EventService.get_all_events())

    @staticmethod
    def get_event_by_id(event_id):
        return jsonify(EventService.get_event_by_id(event_id))

    @staticmethod
    def create_event():
        data = request.get_json()
        new_event = EventService.create_event(data)
        return jsonify({'message': 'Event created successfully', 'event': new_event.to_dict()})

    @staticmethod
    def delete_event(event_id):
        return EventService.delete_event(event_id)

    @staticmethod
    def get_event_types():
        return jsonify(EventService.get_event_types())

    @staticmethod
    def update_event(event_id):
        data = request.get_json()
        event = EventService.update_event(event_id, data)
        return jsonify({'message': 'Event updated successfully', 'event': event.to_dict()})