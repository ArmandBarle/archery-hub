from app.models.bow import Bow
from app import db

class BowService:
    @staticmethod
    def create_bow(data):
        new_bow = Bow(
            bow_strength=data['bow_strength'],
            bow_length=data['bow_length'],
            string_length=data['string_length'],
            bow_material=data['bow_material'],
            bow_type=data['bow_type'],
            bow_draw_length=data['bow_draw_length'],
            brace_height=data['brace_height'],
            user_id=data['user_id'],
        )
        db.session.add(new_bow)
        db.session.commit()
        return new_bow

    @staticmethod
    def get_all_bows():
        return Bow.query.all()

    @staticmethod
    def get_bow_by_id(bow_id):
        return Bow.query.get(bow_id)

    @staticmethod
    def delete_bow(bow_id):
        bow = Bow.query.get(bow_id)
        if bow:
            db.session.delete(bow)
            db.session.commit()
            return True
        return False

    @staticmethod
    def update_bow(bow_id, data):
        bow = Bow.query.get(bow_id)
        if bow:
            bow.bow_strength = data.get('bow_strength', bow.bow_strength)
            bow.bow_length = data.get('bow_length', bow.bow_length)
            bow.string_length = data.get('string_length', bow.string_length)
            bow.bow_material = data.get('bow_material', bow.bow_material)
            bow.bow_type = data.get('bow_type', bow.bow_type)
            bow.bow_draw_length = data.get('bow_draw_length', bow.bow_draw_length)
            bow.brace_height = data.get('brace_height', bow.brace_height)
            bow.user_id = data.get('user_id', bow.user_id)
            db.session.commit()
            return bow
        return None
