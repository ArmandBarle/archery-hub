from app import db
from app.models.equipment_set import EquipmentSet

class EquipmentSetService:
    @staticmethod
    def create_equipment_set(data):
        new_equipment_set = EquipmentSet(
            bow_id=data['bow_id'],
            arrow_id=data['arrow_id'],
            user_id=data['user_id'],
        )
        db.session.add(new_equipment_set)
        db.session.commit()
        return new_equipment_set

    @staticmethod
    def get_all_equipment_sets_by_user_id(user_id):
        return EquipmentSet.query.filter_by(user_id=user_id).all()

    @staticmethod
    def get_equipment_set_by_id(equipment_set_id):
        return EquipmentSet.query.get(equipment_set_id)

    @staticmethod
    def delete_equipment_set(equipment_set_id):
        equipment_set = EquipmentSet.query.get(equipment_set_id)
        if equipment_set:
            db.session.delete(equipment_set)
            db.session.commit()
            return True
        return False

    @staticmethod
    def update_equipment_set(equipment_set_id, data):
        equipment_set = EquipmentSet.query.get(equipment_set_id)
        if equipment_set:
            equipment_set.bow_id = data.get('bow_id', equipment_set.bow_id)
            equipment_set.arrow_id = data.get('arrow_id', equipment_set.arrow_id)
            equipment_set.user_id = data.get('user_id', equipment_set.user_id)
            db.session.commit()
            return equipment_set
        return None