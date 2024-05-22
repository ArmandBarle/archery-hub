from flask import Blueprint, request, jsonify
from app import db
from app.models.arrow import Arrow

arrows_bp = Blueprint('arrows', __name__)


@arrows_bp.route('', methods=['POST'])
def add_arrow():
    data = request.get_json()
    user_id = data.get('user_id')
    arrow_material = data.get('arrow_material')
    arrow_length = data.get('arrow_length')
    arrow_spine = data.get('arrow_spine')
    arrow_diameter = data.get('arrow_diameter')
    arrow_tip = data.get('arrow_tip')
    knock_colour = data.get('knock_colour')
    fletching_type = data.get('fletching_type')
    fletching_colour = data.get('fletching_colour')

    new_arrow = Arrow(
        user_id=user_id,
        arrow_material=arrow_material,
        arrow_length=arrow_length,
        arrow_spine=arrow_spine,
        arrow_diameter=arrow_diameter,
        arrow_tip=arrow_tip,
        knock_colour=knock_colour,
        fletching_type=fletching_type,
        fletching_colour=fletching_colour
    )

    db.session.add(new_arrow)
    db.session.commit()

    return jsonify({'message': 'Arrow added successfully'})


@arrows_bp.route('', methods=['GET'])
def get_all_arrows():
    arrows = Arrow.query.all()
    return jsonify([arrow.to_dict() for arrow in arrows])


@arrows_bp.route('/<int:arrow_id>', methods=['GET'])
def get_arrow(arrow_id):
    arrow = Arrow.query.get_or_404(arrow_id)
    return jsonify(arrow.to_dict())


@arrows_bp.route('/<int:arrow_id>', methods=['DELETE'])
def delete_arrow(arrow_id):
    arrow = Arrow.query.get_or_404(arrow_id)
    db.session.delete(arrow)
    db.session.commit()
    return jsonify({'message': 'Arrow deleted successfully'})
