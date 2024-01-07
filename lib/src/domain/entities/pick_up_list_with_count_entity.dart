import 'package:gelivery_tracker/src/domain/entities/pick_up_entity.dart';

final class PickupListWithCountEntity {
  final List<PickupEntity> items;
  final int totalRecords;

  PickupListWithCountEntity({
    required this.items,
    required this.totalRecords,
  });
}
