from .. import db


class Bow(db.Model):
    __tablename__ = 'bows'
    bow_id = db.Column(db.Integer, primary_key=True)
    bow_strength = db.Column(db.String(50))
    bow_length = db.Column(db.String(50))
    string_length = db.Column(db.String(50))
    bow_material = db.Column(db.String(100))
    bow_type = db.Column(db.String(50))
    bow_draw_length = db.Column(db.String(50))
    brace_height = db.Column(db.String(50))
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
