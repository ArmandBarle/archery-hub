import 'package:flutter/material.dart';

class Event {
  final int eventId;
  final String eventName;
  final int eventTypeId;
  final String eventDescription;
  final String eventLocation;
  final int eventCreatedBy;
  final DateTime eventStartDate;
  final TimeOfDay eventStartTime;
  final DateTime eventCreatedAt;

  Event({
    required this.eventId,
    required this.eventName,
    required this.eventTypeId,
    required this.eventDescription,
    required this.eventLocation,
    required this.eventCreatedBy,
    required this.eventStartDate,
    required this.eventStartTime,
    required this.eventCreatedAt,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['event_id'],
      eventName: json['event_name'],
      eventTypeId: json['event_type_id'],
      eventDescription: json['event_description'],
      eventLocation: json['event_location'],
      eventCreatedBy: json['event_created_by'],
      eventStartDate: DateTime.parse(json['event_start_date']),
      eventStartTime: TimeOfDay(
        hour: int.parse(json['event_start_time'].split(':')[0]),
        minute: int.parse(json['event_start_time'].split(':')[1]),
      ),
      eventCreatedAt: DateTime.parse(json['event_created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'event_id': eventId,
      'event_name': eventName,
      'event_type_id': eventTypeId,
      'event_description': eventDescription,
      'event_location': eventLocation,
      'event_created_by': eventCreatedBy,
      'event_start_date': eventStartDate.toIso8601String(),
      'event_start_time': '${eventStartTime.hour}:${eventStartTime.minute}', 
      'event_created_at': eventCreatedAt.toIso8601String(),
    };
  }
}
