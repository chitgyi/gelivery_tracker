import 'package:gelivery_tracker/src/data/network/request/pickup_list_request.dart';
import 'package:gelivery_tracker/src/data/network/response/pickup_list_response.dart';

abstract interface class PickupRemoteDataSource {
  Future<PickupListResponse> pickupList(
    String token,
    PickupListRequest request,
  );
}
