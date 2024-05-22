from .. import db


class EquipmentSet(db.Model):
    __tablename__ = 'equipment_sets'
    equipment_set_id = db.Column(db.Integer, primary_key=True)
    equipment_set_name = db.Column(db.String(255))
    bow_id = db.Column(db.Integer, db.ForeignKey('bows.bow_id'), nullable=False)
    arrow_id = db.Column(db.Integer, db.ForeignKey('arrows.arrow_id'), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)

    def to_dict(self):
        return {
            'equipment_set_id': self.equipment_set_id,
            'equipment_set_name': self.equipment_set_name,
            'bow_id': self.bow_id,
            'arrow_id': self.arrow_id,
            'user_id': self.user_id
        }