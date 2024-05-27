
class Arrow {
  final int arrowId;
  final int userId;
  final String arrowMaterial;
  final double arrowLength;
  final int arrowSpine;
  final double arrowDiameter;
  final String arrowTip;
  final String knockColour;
  final String fletchingType;
  final String fletchingColour;

  Arrow({
    required this.arrowId,
    required this.userId,
    required this.arrowMaterial,
    required this.arrowLength,
    required this.arrowSpine,
    required this.arrowDiameter,
    required this.arrowTip,
    required this.knockColour,
    required this.fletchingType,
    required this.fletchingColour,
  });

  factory Arrow.fromJson(Map<String, dynamic> json) {
    return Arrow(
      arrowId: json['arrow_id'],
      userId: json['user_id'],
      arrowMaterial: json['arrow_material'],
      arrowLength: json['arrow_length'].toDouble(),
      arrowSpine: json['arrow_spine'],
      arrowDiameter: json['arrow_diameter'].toDouble(),
      arrowTip: json['arrow_tip'],
      knockColour: json['knock_colour'],
      fletchingType: json['fletching_type'],
      fletchingColour: json['fletching_colour'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'arrow_id': arrowId,
      'user_id': userId,
      'arrow_material': arrowMaterial,
      'arrow_length': arrowLength,
      'arrow_spine': arrowSpine,
      'arrow_diameter': arrowDiameter,
      'arrow_tip': arrowTip,
      'knock_colour': knockColour,
      'fletching_type': fletchingType,
      'fletching_colour': fletchingColour,
    };
  }
}
