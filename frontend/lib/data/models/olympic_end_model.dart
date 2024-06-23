class OlympicEnd {
  int? endId;
  int? endNumber;
  int? eventId;
  String? shotOne;
  String? shotTwo;
  String? shotThree;
  String? shotFour;
  String? shotFive;
  String? shotSix;
  int? endTotal;
  int? endTens;
  int? endExes;

  OlympicEnd({
    this.endId,
    this.endNumber,
    this.eventId,
    this.shotOne,
    this.shotTwo,
    this.shotThree,
    this.shotFour,
    this.shotFive,
    this.shotSix,
    this.endTotal,
    this.endTens,
    this.endExes,
  });

  factory OlympicEnd.fromJson(Map<String, dynamic> json) {
    return OlympicEnd(
      endId: json['end_id'],
      endNumber: json['end_number'],
      eventId: json['event_id'],
      shotOne: json['shot_one'],
      shotTwo: json['shot_two'],
      shotThree: json['shot_three'],
      shotFour: json['shot_four'],
      shotFive: json['shot_five'],
      shotSix: json['shot_six'],
      endTotal: json['end_total'],
      endTens: json['end_tens'],
      endExes: json['end_exes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'end_id': endId,
      'end_number': endNumber,
      'event_id': eventId,
      'shot_one': shotOne,
      'shot_two': shotTwo,
      'shot_three': shotThree,
      'shot_four': shotFour,
      'shot_five': shotFive,
      'shot_six': shotSix,
      'end_total': endTotal,
      'end_tens': endTens,
      'end_exes': endExes,
    };
  }
}