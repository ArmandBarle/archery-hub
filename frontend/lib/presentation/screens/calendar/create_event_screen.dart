import 'package:flutter/material.dart';
import 'package:frontend/core/services/event_service.dart';
import 'package:frontend/data/models/event_model.dart';
import 'package:frontend/data/models/event_type_model.dart';

class CreateEventScreen extends StatefulWidget {
  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final _formKey = GlobalKey<FormState>();

  final _eventNameController = TextEditingController();
  final _eventLocationController = TextEditingController();
  final _eventDescriptionController = TextEditingController();
  final _eventStartDateController = TextEditingController();
  final _eventStartTimeController = TextEditingController();

  String? _selectedEventType;
  late Future<List<EventType>> _eventTypes;

  @override
void initState() {
  super.initState();
  _fetchEventTypes(); // Fetch event types on screen initialization
}

void _fetchEventTypes() async {
  _eventTypes = EventService().getEventTypes();
}

  @override
  void dispose() {
    _eventNameController.dispose();
    _eventLocationController.dispose();
    _eventDescriptionController.dispose();
    _eventStartDateController.dispose();
    _eventStartTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<EventType>>(
          future: _eventTypes,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            List<EventType> eventTypes = snapshot.data ?? [];

            return Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: _eventNameController,
                    decoration: InputDecoration(
                      labelText: 'Event Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter event name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _eventLocationController,
                    decoration: InputDecoration(
                      labelText: 'Event Location',
                    ),
                  ),
                  TextFormField(
                    controller: _eventDescriptionController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Event Description',
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedEventType,
                    onChanged: (value) {
                      setState(() {
                        _selectedEventType = value;
                      });
                    },
                    items: eventTypes.map((type) {
                      return DropdownMenuItem<String>(
                        value: type.eventTypeName,
                        child: Text(type.eventTypeName),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Event Type',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select event type';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _eventStartDateController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(DateTime.now().year + 5),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                _eventStartDateController.text =
                                    pickedDate.toString().split(' ')[0];
                              });
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Event Start Date',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select event start date';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _eventStartTimeController,
                          readOnly: true,
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedTime!= null) {
                              setState(() {
                                _eventStartTimeController.text = 
                                  '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
                              });
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Event Start Time',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select event start time';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, proceed to create event
                        // Find the EventType object that matches _selectedEventType
                        EventType? selectedType = eventTypes.firstWhere(
                        (type) => type.eventTypeName == _selectedEventType,
                        orElse: () => EventType(eventTypeId: 0, eventTypeName: 'Unknown'), // default EventType
                        );

                        if (selectedType != null) {
                          // Create Event object with selected event type ID
                          Event newEvent = Event(
                            eventName: _eventNameController.text,
                            eventLocation: _eventLocationController.text,
                            eventDescription: _eventDescriptionController.text,
                            eventTypeId: selectedType.eventTypeId, // Use the eventTypeId of selectedType
                            eventStartDate: DateTime.parse(_eventStartDateController.text),
                            eventStartTime: TimeOfDay(
                              hour: int.parse(_eventStartTimeController.text.split(':')[0]),
                              minute: int.parse(_eventStartTimeController.text.split(':')[1]),
                            ),
                            eventCreatedAt: DateTime.now(),
                            // For now, hardcode the eventCreatedBy to 3 and eventId to 0
                            eventCreatedBy: 3, eventId: 0,
                          );

                          // Call your EventService method to add the event
                          bool success = await EventService().addEvent(newEvent);

                          // Optionally, navigate to a different screen or show a success message

                          if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Event created successfully')),
                            );
                            Navigator.pop(context);
                          }
                          
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Selected event type is not valid')),
                          );
                        }
                      }
                    },
                    child: Text('Create Event'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}