import 'package:gelivery_tracker/src/data/mapper/pickup_mapper.dart';

final class PickupListResponse {
  final List<PickupMapper> items;

  final int totalRecords;

  PickupListResponse(
    this.items,
    this.totalRecords,
  );

  factory PickupListResponse.fromJson(Map<String, dynamic> json) {
    final itemsList = json['data']['items'] as List<dynamic>;
    final items = itemsList
        .map((item) => PickupMapper.fromJson(Map<String, dynamic>.from(item)))
        .toList();
    final totalRecords = json['data']['totalRecords'];
    return PickupListResponse(items, totalRecords);
  }

  Map<String, dynamic> toJson() => {
        "data": {
          "items": items.map((e) => e.toJson()).toList(),
          "totalRecords": totalRecords,
        },
      };
}
