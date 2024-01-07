// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickupListRequest _$PickupListRequestFromJson(Map<String, dynamic> json) =>
    PickupListRequest(
      page: json['first'] as int,
      count: json['max'] as int,
    );

Map<String, dynamic> _$PickupListRequestToJson(PickupListRequest instance) =>
    <String, dynamic>{
      'first': instance.page,
      'max': instance.count,
    };
