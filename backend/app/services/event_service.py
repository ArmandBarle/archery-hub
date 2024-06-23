from app.models.event import Event
from app.models.event_type import EventType
from app import db


class EventService:
    @staticmethod
    def get_all_events():
        return Event.query.all()

    @staticmethod
    def get_event_by_id(event_id):
        return Event.query.get(event_id)

    @staticmethod
    def create_event(data):
        new_event = Event(
            event_name=data.get('event_name'),
            event_type_id=data.get('event_type_id'),
            event_start_date=data.get('event_start_date'),
            event_start_time=data.get('event_start_time'),
            event_location=data.get('event_location'),
            event_description=data.get('event_description'),
            event_created_by=data.get('event_created_by'),
            event_created_at=data.get('event_created_at'),
        )
        print(new_event)
        db.session.add(new_event)
        db.session.commit()

    @staticmethod
    def delete_event(event_id):
        event = Event.query.get(event_id)
        if event:
            db.session.delete(event)
            db.session.commit()
            return True
        return False

    @staticmethod
    def get_event_types():
        return EventType.query.all()

    @staticmethod
    def update_event(event_id, data):
        event = Event.query.get(event_id)
        if event:
            event.event_name = data.get('event_name', event.event_name)
            event.event_type_id = data.get('event_type_id', event.event_type_id)
            event.event_start_date = data.get('event_start_date', event.event_start_date)
            event.event_start_time = data.get('event_start_time', event.event_start_time)
            event.event_location = data.get('event_location', event.event_location)
            event.event_description = data.get('event_description', event.event_description)
            event.event_created_by = data.get('event_created_by', event.event_created_by)
            event.event_created_at = data.get('event_created_at', event.event_created_at)
            db.session.commit()
            return event
        return None