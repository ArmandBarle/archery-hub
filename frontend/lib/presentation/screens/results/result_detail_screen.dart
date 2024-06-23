import 'package:flutter/material.dart';
import 'package:frontend/data/models/results_model.dart';

class ResultDetailScreen extends StatelessWidget {
  final Result result;

  ResultDetailScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result ${result.resultId}"), // Assuming resultId is the unique identifier
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Result ID: ${result.resultId}"),
            Text("User ID: ${result.userId}"),
            Text("Event ID: ${result.eventId}"),
            Text("Result Total: ${result.resultTotal}"),
            // Add other details about the result here
          ],
        ),
      ),
    );
  }
}