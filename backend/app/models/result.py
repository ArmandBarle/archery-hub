from .. import db


class Result(db.Model):
    __tablename__ = 'results'
    result_id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    event_id = db.Column(db.Integer, db.ForeignKey('events.event_id'), nullable=False)
    result_total = db.Column(db.Integer)
    equipment_set_id = db.Column(db.Integer, db.ForeignKey('equipment_sets.equipment_set_id'), nullable=False)
