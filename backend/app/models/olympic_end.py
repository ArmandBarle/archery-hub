from .. import db


class OlympicEnd(db.Model):
    __tablename__ = 'olympic_ends'
    end_id = db.Column(db.Integer, primary_key=True)
    end_number = db.Column(db.Integer)
    event_id = db.Column(db.Integer, db.ForeignKey('events.event_id'), nullable=False)
    shot_one = db.Column(db.String(10))
    shot_two = db.Column(db.String(10))
    shot_three = db.Column(db.String(10))
    shot_four = db.Column(db.String(10))
    shot_five = db.Column(db.String(10))
    shot_six = db.Column(db.String(10))
    end_total = db.Column(db.Integer)
    end_tens = db.Column(db.Integer)
    end_exes = db.Column(db.Integer)
