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

    def to_dict(self):
        return {
            'bow_id': self.bow_id,
            'user_id': self.user_id,
            'bow_strength': self.bow_strength,
            'bow_length': self.bow_length,
            'string_length': self.string_length,
            'bow_material': self.bow_material,
            'bow_type': self.bow_type,
            'bow_draw_length': self.bow_draw_length,
            'brace_height': self.bow_draw_length
        }
