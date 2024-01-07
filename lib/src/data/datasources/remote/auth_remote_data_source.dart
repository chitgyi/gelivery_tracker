import 'package:gelivery_tracker/src/data/mapper/user_mapper.dart';
import 'package:gelivery_tracker/src/data/network/request/login_request.dart';
import 'package:gelivery_tracker/src/data/network/request/logout_request.dart';
import 'package:gelivery_tracker/src/data/network/request/refresh_token_request.dart';

abstract interface class AuthRemoveDataSource {
  Future<UserMapper> login(LoginRequest request);
  Future<UserMapper> revokeNewAccessToken(RefreshTokenRequest request);
  Future<void> logout(String token, LogoutRequest request);
}
