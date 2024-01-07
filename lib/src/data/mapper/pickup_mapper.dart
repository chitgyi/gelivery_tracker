import 'package:faker/faker.dart';
import 'package:gelivery_tracker/src/domain/entities/pick_up_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pickup_mapper.g.dart';

@JsonSerializable()
class PickupMapper {
  @JsonKey(name: 'trackingId')
  final String trackingID;
  final String osName;
  final String osTownshipName;
  final String osPrimaryPhone;
  @JsonKey(name: 'pickupDate')
  final DateTime pickupDateTime;
  final int totalWays;

  PickupMapper({
    required this.trackingID,
    required this.osName,
    required this.osTownshipName,
    required this.osPrimaryPhone,
    required this.pickupDateTime,
    required this.totalWays,
  });

  factory PickupMapper.fromJson(Map<String, dynamic> json) =>
      _$PickupMapperFromJson(json);
  Map<String, dynamic> toJson() => _$PickupMapperToJson(this);

  factory PickupMapper.fromFaker() {
    final faker = Faker();
    return PickupMapper(
      trackingID: faker.guid.guid().substring(0, 8),
      osName: faker.person.name(),
      osPrimaryPhone: faker.phoneNumber.us(),
      osTownshipName: faker.address.city(),
      pickupDateTime: faker.date.dateTime(),
      totalWays: faker.randomGenerator.integer(100),
    );
  }

  PickupEntity toEntity() => PickupEntity(
        trackingID: trackingID,
        osName: osName,
        osTownshipName: osTownshipName,
        osPrimaryPhone: osPrimaryPhone,
        pickupDateTime: pickupDateTime,
        totalWays: totalWays,
      );
}
