from .. import db


class Arrow(db.Model):
    __tablename__ = 'arrows'
    arrow_id = db.Column(db.Integer, primary_key=True)
    arrow_material = db.Column(db.String(100))
    arrow_length = db.Column(db.String(50))
    arrow_spine = db.Column(db.String(50))
    arrow_diameter = db.Column(db.String(50))
    arrow_tip = db.Column(db.String(50))
    knock_colour = db.Column(db.String(50))
    fletching_type = db.Column(db.String(50))
    fletching_colour = db.Column(db.String(50))
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
