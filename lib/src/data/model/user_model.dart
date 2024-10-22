class UserModel {
  final String userName;
  final String password;
  UserModel({required this.password, required this.userName});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(password: json['password'], userName: json['userName']);
  }
}
