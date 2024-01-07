import 'package:gelivery_tracker/src/core/utils/failures/db_failure.dart';
import 'package:gelivery_tracker/src/core/utils/failures/failure.dart';

final class DbException implements Exception {
  final String message;
  DbException(this.message);

  Failure toFailure([String? reason]) => DbFailure(reason ?? message);
}
