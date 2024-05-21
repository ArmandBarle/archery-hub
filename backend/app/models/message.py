from .. import db


class Message(db.Model):
    __tablename__ = 'messages'
    message_id = db.Column(db.Integer, primary_key=True)
    user_id_from = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    user_id_to = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    message_text = db.Column(db.Text)
    message_created_at = db.Column(db.DateTime, default=db.func.current_timestamp())
