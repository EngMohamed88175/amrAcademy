class UserModel {
  final String username;
  final String email;
  final String phone;
  final String country;
  final String password;
  UserModel({
    required this.username,
    required this.email,
    required this.phone,
    required this.country,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'phone': phone,
      'country': country,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      country: map['country'] as String,
      password: map['password'] as String,
    );
  }
}
