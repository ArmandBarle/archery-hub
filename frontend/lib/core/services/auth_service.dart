import 'api_service.dart';

class AuthService {
  final ApiService apiService;

  AuthService(this.apiService);

  Future<void> login(String email, String password) async {
    final response = await apiService.postRequest('/login', {
      'email': email,
      'password': password,
    });
    // Handle login response
    // e.g., store token, handle errors, etc.
  }

  Future<void> register(Map<String, dynamic> registrationData) async {
    final response = await apiService.postRequest('/register', registrationData);
    // Handle registration response
    // e.g., navigate to login, handle errors, etc.
  }
}
