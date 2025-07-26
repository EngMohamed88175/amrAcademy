// ignore_for_file: public_member_api_docs, sort_constructors_first

class LoginModel {

final String email;
final String password;
  LoginModel({
    required this.email,
    required this.password,
  });


 

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginModel.fromJson(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

 
}
