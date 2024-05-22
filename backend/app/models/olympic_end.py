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

    def to_dict(self):
        return {
            'end_id': self.end_id,
            'end_number': self.end_number,
            'event_id': self.event_id,
            'shot_one': self.shot_one,
            'shot_two': self.shot_two,
            'shot_three': self.shot_three,
            'shot_four': self.shot_four,
            'shot_five': self.shot_five,
            'shot_six': self.shot_six,
            'end_total': self.end_total,
            'end_tens': self.end_tens,
            'end_exes': self.end_exes
        }
