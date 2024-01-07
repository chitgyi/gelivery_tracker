import 'package:equatable/equatable.dart';

final class PickupEntity extends Equatable {
  final String trackingID;
  final String osName;
  final String osTownshipName;
  final String osPrimaryPhone;
  final DateTime pickupDateTime;
  final int totalWays;

  const PickupEntity({
    required this.trackingID,
    required this.osName,
    required this.osTownshipName,
    required this.osPrimaryPhone,
    required this.pickupDateTime,
    required this.totalWays,
  });

  @override
  List<Object?> get props => [trackingID];
}
