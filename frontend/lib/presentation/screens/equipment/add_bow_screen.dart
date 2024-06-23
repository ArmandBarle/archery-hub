import 'package:flutter/material.dart';
import 'package:frontend/core/services/equipment_set_service.dart';
import 'package:frontend/data/models/bow_model.dart';

class AddBowScreen extends StatefulWidget {
  final int userId;
  AddBowScreen({required this.userId});

  @override
  _AddBowScreenState createState() => _AddBowScreenState();
}

class _AddBowScreenState extends State<AddBowScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _bowMaterialController = TextEditingController();
  TextEditingController _bowStrengthController = TextEditingController();
  TextEditingController _bowLengthController = TextEditingController();
  TextEditingController _stringLengthController = TextEditingController();
  TextEditingController _bowTypeController = TextEditingController();
  TextEditingController _bowDrawLengthController = TextEditingController();
  TextEditingController _braceHeightController = TextEditingController();

  void _addBow() async {
    if (_formKey.currentState!.validate()) {
      Bow newBow = Bow(
        bowId: 0, // Will be set by the backend
        userId: widget.userId,
        bowStrength: double.parse(_bowStrengthController.text),
        bowLength: double.parse(_bowLengthController.text),
        stringLength: double.parse(_stringLengthController.text),
        bowMaterial: _bowMaterialController.text,
        bowType: _bowTypeController.text,
        bowDrawLength: double.parse(_bowDrawLengthController.text),
        braceHeight: double.parse(_braceHeightController.text),
      );
      await EquipmentService().addBow(newBow);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Bow'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _bowMaterialController,
                decoration: InputDecoration(labelText: 'Bow Material'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter bow material';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bowStrengthController,
                decoration: InputDecoration(labelText: 'Bow Strength'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter bow strength';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bowLengthController,
                decoration: InputDecoration(labelText: 'Bow Length'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter bow length';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _stringLengthController,
                decoration: InputDecoration(labelText: 'String Length'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter string length';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bowTypeController,
                decoration: InputDecoration(labelText: 'Bow Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter bow type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bowDrawLengthController,
                decoration: InputDecoration(labelText: 'Bow Draw Length'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter bow draw length';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _braceHeightController,
                decoration: InputDecoration(labelText: 'Brace Height'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter brace height';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _addBow,
                child: Text('Add Bow'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
