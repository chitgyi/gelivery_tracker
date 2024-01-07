import 'package:json_annotation/json_annotation.dart';

part 'pickup_list_request.g.dart';

@JsonSerializable()
final class PickupListRequest {
  @JsonKey(name: 'first')
  final int page;

  @JsonKey(name: 'max')
  final int count;

  PickupListRequest({
    required this.page,
    required this.count,
  });

  factory PickupListRequest.fromJson(Map<String, dynamic> json) =>
      _$PickupListRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PickupListRequestToJson(this);
}
