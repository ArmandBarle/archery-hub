import 'package:flutter/material.dart';
import 'package:frontend/core/services/result_service.dart';
import 'package:frontend/data/models/results_model.dart';

class AddResultScreen extends StatefulWidget {
  @override
  _AddResultScreenState createState() => _AddResultScreenState();
}

class _AddResultScreenState extends State<AddResultScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userIdController = TextEditingController();
  final _eventIdController = TextEditingController();
  final _resultTotalController = TextEditingController();
  final _equipmentSetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Result"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _userIdController,
                decoration: InputDecoration(labelText: "User ID"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a user ID";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _eventIdController,
                decoration: InputDecoration(labelText: "Event ID"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter an event ID";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _resultTotalController,
                decoration: InputDecoration(labelText: "Result Total"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a result total";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _equipmentSetController,
                decoration: InputDecoration(labelText: "Equipment Set"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter an equipment set";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                child: Text("Add"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Add the new result to the list
                    Result newResult = Result(
                      userId: int.parse(_userIdController.text),
                      eventId: int.parse(_eventIdController.text),
                      resultTotal: int.parse(_resultTotalController.text),
                      equipmentSetId: int.parse(_equipmentSetController.text),
                    );
                    // Call the API to add the new result
                    ResultService().addResult(newResult);
                    Navigator.pop(context);
                  }
                },
),
            ],
          ),
        ),
      ),
    );
  }
}