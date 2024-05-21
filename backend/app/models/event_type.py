from .. import db


class EventType(db.Model):
    __tablename__ = 'event_types'
    event_type_id = db.Column(db.Integer, primary_key=True)
    event_type_name = db.Column(db.String(50), unique=True, nullable=False)
