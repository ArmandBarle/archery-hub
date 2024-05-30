
class User {
  final String email;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String password;

  User({
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.password
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      phoneNumber: json['phone_number'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      password: json['password']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'password':password
    };
  }
}
