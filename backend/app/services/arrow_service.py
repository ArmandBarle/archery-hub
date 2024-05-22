from app.models.arrow import Arrow
from app import db

class ArrowService:
    @staticmethod
    def create_arrow(data):
        new_arrow = Arrow(
            user_id=data.get('user_id'),
            arrow_material=data.get('arrow_material'),
            arrow_length=data.get('arrow_length'),
            arrow_spine=data.get('arrow_spine'),
            arrow_diameter=data.get('arrow_diameter'),
            arrow_tip=data.get('arrow_tip'),
            knock_colour=data.get('knock_colour'),
            fletching_type=data.get('fletching_type'),
            fletching_colour=data.get('fletching_colour')
        )
        db.session.add(new_arrow)
        db.session.commit()
        return new_arrow

    @staticmethod
    def get_all_arrows():
        return Arrow.query.all()

    @staticmethod
    def get_arrow_by_id(arrow_id):
        return Arrow.query.get(arrow_id)

    @staticmethod
    def delete_arrow(arrow_id):
        arrow = Arrow.query.get(arrow_id)
        if arrow:
            db.session.delete(arrow)
            db.session.commit()
            return True
        return False

    @staticmethod
    def update_arrow(arrow_id, data):
        arrow = Arrow.query.get(arrow_id)
        if arrow:
            arrow.user_id = data.get('user_id', arrow.user_id)
            arrow.arrow_material = data.get('arrow_material', arrow.arrow_material)
            arrow.arrow_length = data.get('arrow_length', arrow.arrow_length)
            arrow.arrow_spine = data.get('arrow_spine', arrow.arrow_spine)
            arrow.arrow_diameter = data.get('arrow_diameter', arrow.arrow_diameter)
            arrow.arrow_tip = data.get('arrow_tip', arrow.arrow_tip)
            arrow.knock_colour = data.get('knock_colour', arrow.knock_colour)
            arrow.fletching_type = data.get('fletching_type', arrow.fletching_type)
            arrow.fletching_colour = data.get('fletching_colour', arrow.fletching_colour)
            db.session.commit()
            return arrow
        return None
