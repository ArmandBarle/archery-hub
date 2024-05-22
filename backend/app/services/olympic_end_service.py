from app.models.olympic_end import OlympicEnd
from app import db

class OlympicEndService:
    @staticmethod
    def get_all_olympic_ends_of_event(event_id):
        return OlympicEnd.query.filter_by(event_id=event_id)

    @staticmethod
    def create_olympic_end(data):
        new_olympic_end = OlympicEnd(
            end_id = data['end_id'],
            end_number = data['end_number'],
            event_id = data['event_id'],
            shot_one = data['shot_one'],
            shot_two = data['shot_two'],
            shot_three = data['shot_three'],
            shot_four = data['shot_four'],
            shot_five = data['shot_five'],
            shot_six = data['shot_six'],
            end_total = data['end_total'],
            end_tens = data['end_tens'],
            end_exes = data['end_exes']
        )

        db.session.add(new_olympic_end)
        db.session.commit()
        return new_olympic_end

    @staticmethod
    def delete_olympic_end(olympic_end_id):
        olympic_end = OlympicEnd.query.get(olympic_end_id)
        if olympic_end:
            db.session.delete(olympic_end)
            db.session.commit()
            return True
        return False