import 'package:flutter/material.dart';
import 'package:frontend/core/services/event_service.dart';
import 'package:frontend/data/models/event_model.dart';

class EventsListScreen extends StatefulWidget {
  const EventsListScreen({super.key});

  @override
  _EventsListScreenState createState() => _EventsListScreenState();
}

class _EventsListScreenState extends State<EventsListScreen> {
  late Future<List<Event>> _futureEvents;

  @override
  void initState() {
    super.initState();
    _futureEvents = EventService().getAllEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event List'),
      ),
      body: FutureBuilder<List<Event>>(
        future: _futureEvents,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return const Center(child: Text('Failed to load events'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No events found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final event = snapshot.data![index];
                return ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await EventService().deleteEvent(event.eventId);
                      setState(() {
                        _futureEvents = EventService().getAllEvents();
                      });
                    },
                  ),
                  title: Text(event.eventName),
                  subtitle: Text(event.eventDescription),
                );
              },
            );
          }
        },
      ),
    );
  }
}