import 'package:flutter/material.dart';
import 'package:gelivery_tracker/src/core/utils/extensions/date_time_ext.dart';
import 'package:gelivery_tracker/src/domain/entities/pick_up_entity.dart';

class PickupListViewItem extends StatelessWidget {
  const PickupListViewItem({
    super.key,
    required this.pickupEntity,
    required this.position,
  });
  final PickupEntity pickupEntity;
  final String position;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pickupEntity.trackingID,
                    style: const TextStyle(
                      color: Colors.blue,
                      height: 2,
                    ),
                  ),
                  Text(
                    pickupEntity.osName,
                    style: const TextStyle(
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pickupEntity.osTownshipName,
                    style: const TextStyle(
                      height: 2,
                    ),
                  ),
                  Text(
                    pickupEntity.osPrimaryPhone,
                    style: const TextStyle(
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    pickupEntity.pickupDateTime.toDefaultDateFormat(),
                    style: const TextStyle(
                      height: 2,
                    ),
                  ),
                  Text(
                    "${pickupEntity.totalWays} ways",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 2,
                    ),
                  ),
                  Text(
                    position,
                    style: const TextStyle(
                      height: 2,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
