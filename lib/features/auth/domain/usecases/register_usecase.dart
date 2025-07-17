import 'package:new_chat_me/features/auth/domain/repositories/auth_repository.dart';

import '../entities/user_entity.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase({required this.repository});
  Future<UserEntity> call(String username, String email, String password) {
    return repository.register(username, email, password);
  }
}
