import 'dart:convert';

import 'api_service.dart';

class ArrowService {
  final ApiService apiService;

  ArrowService(this.apiService);

  Future<void> addArrow(Map<String, dynamic> arrowData) async {
    final response = await apiService.postRequest('/arrows', arrowData);
    // Handle add arrow response
  }

  Future<List<dynamic>> getAllArrows() async {
    final response = await apiService.getRequest('/arrows');
    return jsonDecode(response.body) as List<dynamic>;
  }

  Future<void> deleteArrow(int arrowId) async {
    final response = await apiService.deleteRequest('/arrows/$arrowId');
    // Handle delete arrow response
  }
}
