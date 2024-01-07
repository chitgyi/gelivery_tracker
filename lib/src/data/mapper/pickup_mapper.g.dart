// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_mapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickupMapper _$PickupMapperFromJson(Map<String, dynamic> json) => PickupMapper(
      trackingID: json['trackingId'] as String,
      osName: json['osName'] as String,
      osTownshipName: json['osTownshipName'] as String,
      osPrimaryPhone: json['osPrimaryPhone'] as String,
      pickupDateTime: DateTime.parse(json['pickupDate'] as String),
      totalWays: json['totalWays'] as int,
    );

Map<String, dynamic> _$PickupMapperToJson(PickupMapper instance) =>
    <String, dynamic>{
      'trackingId': instance.trackingID,
      'osName': instance.osName,
      'osTownshipName': instance.osTownshipName,
      'osPrimaryPhone': instance.osPrimaryPhone,
      'pickupDate': instance.pickupDateTime.toIso8601String(),
      'totalWays': instance.totalWays,
    };
