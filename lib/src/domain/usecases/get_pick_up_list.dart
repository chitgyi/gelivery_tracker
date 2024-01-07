import 'package:gelivery_tracker/src/core/domain/use_case.dart';
import 'package:gelivery_tracker/src/core/utils/exceptions/network_exception.dart';
import 'package:gelivery_tracker/src/domain/entities/pick_up_list_with_count_entity.dart';
import 'package:gelivery_tracker/src/domain/repositories/pickup_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UseCase<Result<PickupListWithCountEntity>, GetPickupListParams>)
final class GetPickupList
    implements UseCase<Result<PickupListWithCountEntity>, GetPickupListParams> {
  final PickupRepo _repo;
  const GetPickupList(this._repo);
  @override
  Future<Result<PickupListWithCountEntity>> call(
    GetPickupListParams param,
  ) async {
    try {
      final data = await _repo.pickupList(param.page, param.count);
      return Success(data);
    } on NetworkException catch (e) {
      return Failed(e.toFailure());
    }
  }
}

final class GetPickupListParams {
  final int page;
  final int count;

  const GetPickupListParams(this.page, this.count);
}
