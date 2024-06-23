class Result {
  int? resultId;
  int? userId;
  int? eventId;
  int? resultTotal;
  int? equipmentSetId;

  Result({
    this.resultId,
    this.userId,
    this.eventId,
    this.resultTotal,
    this.equipmentSetId,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      resultId: json['result_id'],
      userId: json['user_id'],
      eventId: json['event_id'],
      resultTotal: json['result_total'],
      equipmentSetId: json['equipment_set_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'esult_id': resultId,
      'user_id': userId,
      'event_id': eventId,
      'result_total': resultTotal,
      'equipment_set_id': equipmentSetId,
    };
  }
}