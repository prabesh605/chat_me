import 'package:new_chat_me/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String id,
    required String email,
    required String username,
  }) : super(
          id: id,
          email: email,
          username: username,
        );
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
    );
  }
}
