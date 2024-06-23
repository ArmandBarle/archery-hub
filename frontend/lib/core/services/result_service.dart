import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:frontend/core/constants/constants.dart';
import 'package:frontend/data/models/results_model.dart';

class ResultService{

  final baseUrl = AppConstants.baseUrl;


  Future<List<Result>> getAllResults() async {
    final url = Uri.parse('$baseUrl/results');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> resultsJson = jsonDecode(response.body);
      return resultsJson.map((json) => Result.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load results');
    }
  }

  Future<List<Result>> getResultsById(int resultId) async {
    final url = Uri.parse('$baseUrl/results/user/$resultId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> resultsJson = jsonDecode(response.body);
      return resultsJson.map((json) => Result.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load results');
    }
  }

  void addResult(Result newResult) async {
    final response = await http.post(
      Uri.parse('$baseUrl/results'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(newResult.toJson()),
    );
  }
}