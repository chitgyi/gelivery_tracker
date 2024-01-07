import 'package:gelivery_tracker/src/data/datasources/local/user_local_data_source.dart';
import 'package:gelivery_tracker/src/data/datasources/remote/pickup_remote_data_source.dart';
import 'package:gelivery_tracker/src/data/network/request/pickup_list_request.dart';
import 'package:gelivery_tracker/src/domain/entities/pick_up_list_with_count_entity.dart';
import 'package:gelivery_tracker/src/domain/repositories/pickup_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PickupRepo)
final class PickupRepoImpl implements PickupRepo {
  final PickupRemoteDataSource _pickupRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;
  const PickupRepoImpl(this._pickupRemoteDataSource, this._userLocalDataSource);

  @override
  Future<PickupListWithCountEntity> pickupList(int page, int count) async {
    final user = await _userLocalDataSource.getUser();
    final data = await _pickupRemoteDataSource.pickupList(
      user.accessToken,
      PickupListRequest(page: page, count: count),
    );
    return PickupListWithCountEntity(
      items: data.items.map((e) => e.toEntity()).toList(),
      totalRecords: data.totalRecords,
    );
  }
}
