from .. import db


class EquipmentSet(db.Model):
    __tablename__ = 'equipment_sets'
    equipment_set_id = db.Column(db.Integer, primary_key=True)
    equipment_set_name = db.Column(db.String(255))
    bow_id = db.Column(db.Integer, db.ForeignKey('bows.bow_id'), nullable=False)
    arrow_id = db.Column(db.Integer, db.ForeignKey('arrows.arrow_id'), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
