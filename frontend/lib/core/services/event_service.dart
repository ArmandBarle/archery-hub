import 'dart:convert';
import 'package:frontend/core/constants/constants.dart';
import 'package:frontend/data/models/event_model.dart';
import 'package:frontend/data/models/event_type_model.dart';
import 'package:http/http.dart' as http;

class EventService {
    final String baseUrl = AppConstants.baseUrl;

    Future<List<Event>> getAllEvents() async {
        final url = Uri.parse('$baseUrl/events');
        final response = await http.get(url);

        if (response.statusCode == 200) {
            final List<dynamic> eventsJson = jsonDecode(response.body);
            return eventsJson.map((json) => Event.fromJson(json)).toList();
        } else {
            throw Exception('Failed to load events');
        }
    }

    Future<Event> getEventById(int eventId) async {
        final url = Uri.parse('$baseUrl/events/$eventId');
        final response = await http.get(url);

        if (response.statusCode == 200) {
            final eventJson = jsonDecode(response.body);
            return Event.fromJson(eventJson);
        } else {
            throw Exception('Failed to get event');
        }
    }

    Future<bool> addEvent(Event event) async {
    final response = await http.post(
      Uri.parse('$baseUrl/events'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(event.toJson()),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to add arrow: ${response.statusCode}');
    }
  }

  Future<List<EventType>> getEventTypes() async {
    final url = Uri.parse('$baseUrl/events/event_types');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> eventTypesJson = jsonDecode(response.body);
      return eventTypesJson.map((json) => EventType.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load event types');
    }
  }

  deleteEvent(int eventId) async {
    final url = Uri.parse('$baseUrl/events/$eventId');
    final response = await http.delete(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete event');
    }

  }
}