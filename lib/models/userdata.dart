class UserData {
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  final String phone;

  UserData({
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }
}
