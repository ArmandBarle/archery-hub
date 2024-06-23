class Bow {
  final int bowId;
  final int userId;
  final double bowStrength;
  final double bowLength;
  final double stringLength;
  final String bowMaterial;
  final String bowType;
  final double bowDrawLength;
  final double braceHeight;

  Bow({
    required this.bowId,
    required this.userId,
    required this.bowStrength,
    required this.bowLength,
    required this.stringLength,
    required this.bowMaterial,
    required this.bowType,
    required this.bowDrawLength,
    required this.braceHeight,
  });

  factory Bow.fromJson(Map<String, dynamic> json) {
    return Bow(
      bowId: json['bow_id'],
      userId: json['user_id'],
      bowStrength: double.tryParse(json['bow_strength'].toString()) ?? 0.0,
      bowLength: double.tryParse(json['bow_length'].toString()) ?? 0.0,
      stringLength: double.tryParse(json['string_length'].toString()) ?? 0.0,
      bowMaterial: json['bow_material'],
      bowType: json['bow_type'],
      bowDrawLength: double.tryParse(json['bow_draw_length'].toString()) ?? 0.0,
      braceHeight: double.tryParse(json['brace_height'].toString()) ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bow_id': bowId,
      'user_id': userId,
      'bow_strength': bowStrength,
      'bow_length': bowLength,
      'string_length': stringLength,
      'bow_material': bowMaterial,
      'bow_type': bowType,
      'bow_draw_length': bowDrawLength,
      'brace_height': braceHeight,
    };
  }
}
