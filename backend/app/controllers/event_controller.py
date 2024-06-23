from datetime import datetime, time

from flask import Blueprint, request, jsonify
from app.services.event_service import EventService

def serialize_datetime(obj):
    if isinstance(obj, (datetime, time)):
        return obj.isoformat()

class EventController:


    @staticmethod
    def get_all_events():
        events = EventService.get_all_events()
        events_data = [event.to_dict() for event in events]

        # Serialize datetime objects in each event's dictionary
        for event_data in events_data:
            for key, value in event_data.items():
                if isinstance(value, (datetime, time)):
                    event_data[key] = serialize_datetime(value)

        return jsonify(events_data), 200

    @staticmethod
    def get_event_by_id(event_id):
        event = EventService.get_event_by_id(event_id)
        event_data = event.to_dict()

        for key, value in event_data.items():
            if isinstance(value, (datetime, time)):
                event_data[key] = serialize_datetime(value)

        return jsonify(event_data), 200

    @staticmethod
    def create_event():
        data = request.get_json()
        EventService.create_event(data)
        return jsonify({'message': 'Event created successfully'}), 201

    @staticmethod
    def delete_event(event_id):
        return EventService.delete_event(event_id)

    @staticmethod
    def get_event_types():
        event_types = EventService.get_event_types()
        return jsonify([event_type.to_dict() for event_type in event_types]),200

    @staticmethod
    def update_event(event_id):
        data = request.get_json()
        event = EventService.update_event(event_id, data)
        return jsonify({'message': 'Event updated successfully', 'event': event.to_dict()})