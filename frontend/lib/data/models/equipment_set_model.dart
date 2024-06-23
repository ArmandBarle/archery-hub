class EquipmentSet {
  final String equipmentSetName;
  final int bowId;
  final int arrowId;
  final int userId;

  EquipmentSet({
    required this.equipmentSetName,
    required this.bowId,
    required this.arrowId,
    required this.userId,
  });

  factory EquipmentSet.fromJson(Map<String, dynamic> json) {
    return EquipmentSet(
      equipmentSetName: json['equipment_set_name'],
      bowId: json['bow_id'],
      arrowId: json['arrow_id'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'equipment_set_name': equipmentSetName,
      'bow_id': bowId,
      'arrow_id': arrowId,
      'user_id': userId,
    };
  }
}
