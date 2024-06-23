import 'package:flutter/material.dart';
import 'package:frontend/core/services/equipment_set_service.dart';
import 'package:frontend/data/models/equipment_set_model.dart';
import 'package:frontend/data/models/bow_model.dart';
import 'package:frontend/data/models/arrow_model.dart';
import 'package:frontend/presentation/screens/equipment/add_arrow_screen.dart';
import 'package:frontend/presentation/screens/equipment/add_bow_screen.dart';

class AddEquipmentScreen extends StatefulWidget {
  final int userId;
  AddEquipmentScreen({required this.userId});

  @override
  _AddEquipmentScreenState createState() => _AddEquipmentScreenState();
}

class _AddEquipmentScreenState extends State<AddEquipmentScreen> {
  late Future<List<Bow>> _futureBows;
  late Future<List<Arrow>> _futureArrows;
  Bow? _selectedBow;
  Arrow? _selectedArrow;
  TextEditingController _equipmentNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  void _refreshData() {
    _futureBows = EquipmentService().getBows();
    _futureArrows = EquipmentService().getArrows();
  }

  void _addEquipment() async {
    if (_selectedBow != null && _selectedArrow != null && _equipmentNameController.text.isNotEmpty) {
      EquipmentSet newEquipment = EquipmentSet(
        equipmentSetName: _equipmentNameController.text,
        bowId: _selectedBow!.bowId,
        arrowId: _selectedArrow!.arrowId,
        userId: widget.userId,
      );
      await EquipmentService().addEquipment(widget.userId, newEquipment);
      Navigator.pop(context, true);
    }
  }

  void _navigateToAddBow() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddBowScreen(userId: widget.userId)),
    );
    if (result == true) {
      setState(() {
        _refreshData();
      });
    }
  }

  void _navigateToAddArrow() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddArrowScreen(userId: widget.userId)),
    );
    if (result == true) {
      setState(() {
        _refreshData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Equipment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _equipmentNameController,
              decoration: InputDecoration(labelText: 'Equipment Name'),
            ),
            Row(
              children: [
                Expanded(
                  child: FutureBuilder<List<Bow>>(
                    future: _futureBows,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final bows = snapshot.data ?? [];
                        return DropdownButton<Bow>(
                          hint: Text('Select Bow'),
                          value: _selectedBow,
                          onChanged: (Bow? newValue) {
                            setState(() {
                              _selectedBow = newValue;
                            });
                          },
                          items: bows.map((Bow bow) {
                            return DropdownMenuItem<Bow>(
                              value: bow,
                              child: Text(bow.bowMaterial),
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _navigateToAddBow,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FutureBuilder<List<Arrow>>(
                    future: _futureArrows,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final arrows = snapshot.data ?? [];
                        return DropdownButton<Arrow>(
                          hint: Text('Select Arrow'),
                          value: _selectedArrow,
                          onChanged: (Arrow? newValue) {
                            setState(() {
                              _selectedArrow = newValue;
                            });
                          },
                          items: arrows.map((Arrow arrow) {
                            return DropdownMenuItem<Arrow>(
                              value: arrow,
                              child: Text(arrow.arrowMaterial),
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _navigateToAddArrow,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _addEquipment,
              child: Text('Add Equipment'),
            ),
          ],
        ),
      ),
    );
  }
}
