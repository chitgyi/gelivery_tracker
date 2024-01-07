import 'package:gelivery_tracker/src/domain/entities/pick_up_list_with_count_entity.dart';

abstract interface class PickupRepo {
  Future<PickupListWithCountEntity> pickupList(int page, int count);
}
