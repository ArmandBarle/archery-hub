import 'dart:convert';
import 'package:frontend/core/constants/constants.dart';
import 'package:frontend/data/models/arrow_model.dart';
import 'package:frontend/data/models/bow_model.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/data/models/equipment_set_model.dart';  // Update this import
import 'package:frontend/data/repositories/secure_storage.dart';

class EquipmentService {
  final String baseUrl = AppConstants.baseUrl;
  final storage = SecureStorage();

  Future<List<EquipmentSet>> getUserEquipment(int userId) async {
    final token = await storage.read('auth_token');
    final response = await http.get(
      Uri.parse('$baseUrl/equipment/$userId'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((equipment) => EquipmentSet.fromJson(equipment)).toList();
    } else {
      throw Exception('Failed to load equipment');
    }
  }

  Future<void> addEquipment(int userId, EquipmentSet equipment) async {
    final token = await storage.read('auth_token');
    final response = await http.post(
      Uri.parse('$baseUrl/equipment'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(equipment.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add equipment');
    }
  }

  Future<List<Bow>> getBows() async {
    final token = await storage.read('auth_token');
    final response = await http.get(
      Uri.parse('$baseUrl/bows'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((bows) => Bow.fromJson(bows)).toList();
    } else {
      throw Exception('Failed to load bows');
    }

  }

  Future<List<Arrow>> getArrows() async {
    final token = storage.read('auth_token');
    final response = await http.get(
      Uri.parse('$baseUrl/arrows'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((arrows) => Arrow.fromJson(arrows)).toList();
    } else {
      throw Exception('Failed to load arrows');
    }
  }

  addBow(Bow newBow) async {
    final response = await http.post(
      Uri.parse('$baseUrl/bows'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(newBow.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add bow: ${response.statusCode}');
    }
  }

  addArrow(Arrow newArrow) async {
    final response = await http.post(
      Uri.parse('$baseUrl/arrows'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(newArrow.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add arrow: ${response.statusCode}');
    }
  }
}
