from app.models.result import Result
from app import db

class ResultService:
    @staticmethod
    def add_result(data):
        new_result = Result(
            user_id=data['user_id'],
            event_id=data['event_id'],
            result_total=data['result_total'],
            equipment_set_id=data['equipment_set_id']
        )
        db.session.add(new_result)
        db.session.commit()
        return new_result

    @staticmethod
    def delete_result(result_id):
        result = Result.query.get(result_id)
        if result:
            db.session.delete(result)
            db.session.commit()
            return True
        return False

    @staticmethod
    def get_result_by_event_id(event_id):
        return Result.query.get(event_id)

    @staticmethod
    def get_all_results():
        return Result.query.all()

    @staticmethod
    def update_result(result_id, data):
        result = Result.query.get(result_id)
        if result:
            result.user_id = data.get('user_id', result.user_id)
            result.event_id = data.get('event_id', result.event_id)
            result.result_total = data.get('result_total', result.result_total)
            result.equipment_set_id = data.get('equipment_set_id', result.equipment_set_id)
            db.session.commit()
            return result
        return None