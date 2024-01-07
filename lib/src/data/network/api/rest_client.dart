import 'package:dio/dio.dart';
import 'package:gelivery_tracker/src/data/network/request/login_request.dart';
import 'package:gelivery_tracker/src/data/network/request/logout_request.dart';
import 'package:gelivery_tracker/src/data/network/request/pickup_list_request.dart';
import 'package:gelivery_tracker/src/data/network/request/refresh_token_request.dart';
import 'package:gelivery_tracker/src/data/network/response/login_response.dart';
import 'package:gelivery_tracker/src/data/network/response/pickup_list_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract interface class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/v3/user/')
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST('/v3/user/refresh_token')
  Future<LoginResponse> revokeNewAccessToken(
      @Body() RefreshTokenRequest request);

  @POST('/v3/user/revoke_access_token_by_username')
  Future<void> logout(
    @Header('Authorization') String token,
    @Body() LogoutRequest request,
  );

  @POST('/v4/pickup/list')
  Future<PickupListResponse> getPickupList(
      @Header('Authorization') String token, @Body() PickupListRequest request);
}
