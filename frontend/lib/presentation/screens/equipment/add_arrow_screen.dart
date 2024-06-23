import 'package:flutter/material.dart';
import 'package:frontend/core/services/equipment_set_service.dart';
import 'package:frontend/data/models/arrow_model.dart';

class AddArrowScreen extends StatefulWidget {
  final int userId;
  AddArrowScreen({required this.userId});

  @override
  _AddArrowScreenState createState() => _AddArrowScreenState();
}

class _AddArrowScreenState extends State<AddArrowScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _arrowMaterialController = TextEditingController();
  TextEditingController _arrowLengthController = TextEditingController();
  TextEditingController _arrowSpineController = TextEditingController();
  TextEditingController _arrowDiameterController = TextEditingController();
  TextEditingController _arrowTipController = TextEditingController();
  TextEditingController _knockColourController = TextEditingController();
  TextEditingController _fletchingTypeController = TextEditingController();
  TextEditingController _fletchingColourController = TextEditingController();

  void _addArrow() async {
    if (_formKey.currentState!.validate()) {
      Arrow newArrow = Arrow(
        arrowId: 0, // Will be set by the backend
        userId: widget.userId,
        arrowMaterial: _arrowMaterialController.text,
        arrowLength: double.parse(_arrowLengthController.text),
        arrowDiameter: double.parse(_arrowDiameterController.text),
        arrowSpine: int.parse(_arrowSpineController.text),
        arrowTip: _arrowTipController.text,
        knockColour: _knockColourController.text,
        fletchingType: _fletchingTypeController.text,
        fletchingColour: _fletchingColourController.text,
      );
      await EquipmentService().addArrow(newArrow);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Arrow'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _arrowMaterialController,
                decoration: InputDecoration(labelText: 'Arrow Material'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter arrow material';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _arrowLengthController,
                decoration: InputDecoration(labelText: 'Arrow Length'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter arrow length';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _arrowSpineController,
                decoration: InputDecoration(labelText: 'Arrow Spine'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter arrow spine';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _arrowDiameterController,
                decoration: InputDecoration(labelText: 'Arrow Diameter'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter arrow diameter';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _arrowTipController,
                decoration: InputDecoration(labelText: 'Arrow Tip'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter arrow tip';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _knockColourController,
                decoration: InputDecoration(labelText: 'Knock Colour'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter knock colour';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fletchingTypeController,
                decoration: InputDecoration(labelText: 'Fletching Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter fletching type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fletchingColourController,
                decoration: InputDecoration(labelText: 'Fletching Colour'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter fletching colour';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _addArrow,
                child: Text('Add Arrow'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
