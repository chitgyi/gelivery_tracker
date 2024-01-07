import 'package:dio/dio.dart';
import 'package:gelivery_tracker/src/core/utils/extensions/dio_exception_ext.dart';
import 'package:gelivery_tracker/src/data/datasources/remote/auth_remote_data_source.dart';
import 'package:gelivery_tracker/src/data/mapper/user_mapper.dart';
import 'package:gelivery_tracker/src/data/network/api/rest_client.dart';
import 'package:gelivery_tracker/src/data/network/request/login_request.dart';
import 'package:gelivery_tracker/src/data/network/request/logout_request.dart';
import 'package:gelivery_tracker/src/data/network/request/refresh_token_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoveDataSource)
final class AuthRemoteDataSourceImpl implements AuthRemoveDataSource {
  final RestClient _client;
  AuthRemoteDataSourceImpl(this._client);

  @override
  Future<UserMapper> login(LoginRequest request) async {
    try {
      final response = await _client.login(request);
      return response.user;
    } on DioException catch (e) {
      throw e.toNetworkException();
    }
  }

  @override
  Future<void> logout(String token, LogoutRequest request) async {
    try {
      await _client.logout(token, request);
    } on DioException catch (e) {
      throw e.toNetworkException();
    }
  }

  @override
  Future<UserMapper> revokeNewAccessToken(RefreshTokenRequest request) async {
    try {
      final response = await _client.revokeNewAccessToken(request);
      return response.user;
    } on DioException catch (e) {
      throw e.toNetworkException();
    }
  }
}
