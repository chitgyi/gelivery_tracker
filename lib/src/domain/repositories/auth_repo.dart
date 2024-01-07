import 'package:gelivery_tracker/src/domain/entities/user_entity.dart';

abstract interface class AuthRepo {
  Future<UserEntity> login(String username, String password);
  Future<UserEntity> getUser();
  Future<void> refreshToken();
  Future<void> logout();
}
