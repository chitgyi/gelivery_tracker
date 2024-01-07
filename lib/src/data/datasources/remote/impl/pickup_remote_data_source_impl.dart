import 'package:dio/dio.dart';
import 'package:gelivery_tracker/src/core/utils/extensions/dio_exception_ext.dart';
import 'package:gelivery_tracker/src/data/datasources/remote/pickup_remote_data_source.dart';
import 'package:gelivery_tracker/src/data/network/api/rest_client.dart';
import 'package:gelivery_tracker/src/data/network/request/pickup_list_request.dart';
import 'package:gelivery_tracker/src/data/network/response/pickup_list_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PickupRemoteDataSource)
final class PickRemoteDataSourceImpl implements PickupRemoteDataSource {
  final RestClient _client;

  PickRemoteDataSourceImpl(this._client);

  @override
  Future<PickupListResponse> pickupList(
    String token,
    PickupListRequest request,
  ) async {
    try {
      return await _client.getPickupList('Bearer $token', request);
    } on DioException catch (e) {
      throw e.toNetworkException();
    }
  }
}
