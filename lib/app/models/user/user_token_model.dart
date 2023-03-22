import 'package:mueynail/app/models/user/user_model.dart';

class UserTokenModel {
  final UserModel user;
  final String token;

  UserTokenModel({
    required this.user,
    required this.token,
  });

  factory UserTokenModel.fromJson(Map<String, dynamic> json) {
    return UserTokenModel(
      user: UserModel.fromJson(json['user']),
      token: json['token'],
    );
  }
}
