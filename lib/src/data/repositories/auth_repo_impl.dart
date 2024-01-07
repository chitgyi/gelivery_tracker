import 'package:gelivery_tracker/src/data/datasources/local/user_local_data_source.dart';
import 'package:gelivery_tracker/src/data/datasources/remote/auth_remote_data_source.dart';
import 'package:gelivery_tracker/src/data/network/request/login_request.dart';
import 'package:gelivery_tracker/src/data/network/request/logout_request.dart';
import 'package:gelivery_tracker/src/data/network/request/refresh_token_request.dart';
import 'package:gelivery_tracker/src/domain/entities/user_entity.dart';
import 'package:gelivery_tracker/src/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
final class AuthRepoImpl implements AuthRepo {
  final AuthRemoveDataSource _authRemoveDataSource;
  final UserLocalDataSource _userLocalDataSource;

  AuthRepoImpl(this._authRemoveDataSource, this._userLocalDataSource);

  @override
  Future<UserEntity> login(String username, String password) async {
    final user = await _authRemoveDataSource.login(
      LoginRequest(username: username, password: password),
    );
    await _userLocalDataSource.saveUser(user);
    return user.toEntity();
  }

  @override
  Future<void> logout() async {
    final user = await _userLocalDataSource.getUser();
    await _userLocalDataSource.removeUser();
    await _authRemoveDataSource.logout(
      user.accessToken,
      const LogoutRequest('key', 'value'),
    );
  }

  @override
  Future<void> refreshToken() async {
    final user = await _userLocalDataSource.getUser();
    final updatedUser = await _authRemoveDataSource.revokeNewAccessToken(
      RefreshTokenRequest(user.refreshToken),
    );
    _userLocalDataSource.saveUser(updatedUser);
  }

  @override
  Future<UserEntity> getUser() async {
    final userMapper = await _userLocalDataSource.getUser();
    return userMapper.toEntity();
  }
}
