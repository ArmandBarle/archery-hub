from .. import db


class Role(db.Model):
    __tablename__ = 'roles'
    role_id = db.Column(db.Integer, primary_key=True)
    role_name = db.Column(db.String(50), unique=True, nullable=False)

    def to_dict(self):
        return {
            'role_id': self.role_id,
            'role_name': self.role_name
        }