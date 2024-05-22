from .. import db


class Event(db.Model):
    __tablename__ = 'events'
    event_id = db.Column(db.Integer, primary_key=True)
    event_name = db.Column(db.String(255), nullable=False)
    event_type_id = db.Column(db.Integer, db.ForeignKey('event_types.event_type_id'), nullable=False)
    event_description = db.Column(db.Text)
    event_location = db.Column(db.String(255))
    event_created_by = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    event_start_date = db.Column(db.DateTime, nullable=False)
    event_start_time = db.Column(db.Time, nullable=False)
    event_created_at = db.Column(db.DateTime, default=db.func.current_timestamp())

    def to_dict(self):
        return {
            'event_id': self.event_id,
            'event_name': self.event_name,
            'event_type_id': self.event_type_id,
            'event_description': self.event_description,
            'event_location': self.event_location,
            'event_created_by': self.event_created_by,
            'event_start_date': self.event_start_date,
            'event_start_time': self.event_start_time,
            'event_created_at': self.event_created_at
        }