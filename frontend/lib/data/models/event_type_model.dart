class EventType {
  final int eventTypeId;
  final String eventTypeName;

  EventType({
    required this.eventTypeId,
    required this.eventTypeName,
  });

  factory EventType.fromJson(Map<String, dynamic> json) {
    return EventType(
      eventTypeId: json['event_type_id'],
      eventTypeName: json['event_type_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'event_type_id': eventTypeId,
      'event_type_name': eventTypeName,
    };
  }
}
