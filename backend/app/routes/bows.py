from flask import Blueprint, request, jsonify
from app import db
from app.models.bow import Bow

bows_bp = Blueprint('bows', __name__)


@bows_bp.route('/', methods=['POST'])
def create_bow():
    data = request.get_json()
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
    return jsonify(new_bow.to_dict()), 201


@bows_bp.route('/', methods=['GET'])
def get_bows():
    all_bows = Bow.query.all()
    return jsonify([bow.to_dict() for bow in all_bows]), 200


@bows_bp.route('/<int:bow_id>', methods=['GET'])
def get_bow(bow_id):
    bow = Bow.query.get_or_404(bow_id)
    return jsonify(bow.to_dict()), 200


@bows_bp.route('/<int:bow_id>', methods=['DELETE'])
def delete_bow(bow_id):
    bow = Bow.query.get_or_404(bow_id)
    db.session.delete(bow)
    db.session.commit()
    return jsonify({'message': 'Bow deleted successfully'}), 200