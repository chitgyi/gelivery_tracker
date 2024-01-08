import 'package:gelivery_tracker/src/core/utils/failures/failure.dart';
import 'package:gelivery_tracker/src/core/utils/failures/network_failure.dart';

abstract class NetworkException implements Exception {
  final String message;
  final String? codeStatus;
  const NetworkException(this.message, [this.codeStatus]);

  Failure toFailure([String? reason]) => ConnectionFailure(reason ?? message);
}

final class NotFoundException extends NetworkException {
  const NotFoundException(super.message, [super.statusCode]);

  @override
  Failure toFailure([String? reason]) => NotFoundFailure(reason ?? message);
}

final class InternetConnectionException extends NetworkException {
  const InternetConnectionException(super.message, [super.codeStatus]);

  @override
  Failure toFailure([String? reason]) => ConnectionFailure(reason ?? message);
}

final class TimeoutException extends NetworkException {
  const TimeoutException(super.message, [super.codeStatus]);
  @override
  Failure toFailure([String? reason]) => TimeoutFailure(reason ?? message);
}

final class BadRequestException extends NetworkException {
  const BadRequestException(super.message, [super.statusCode]);
  @override
  Failure toFailure([String? reason]) => BadReqFailure(reason ?? message);
}

final class UnAuthorizedException extends NetworkException {
  const UnAuthorizedException(super.message, [super.statusCode]);

  @override
  Failure toFailure([String? reason]) => SessionFailure(reason ?? message);
}

final class ServerException extends NetworkException {
  const ServerException(super.message, [super.statusCode]);

  @override
  Failure toFailure([String? reason]) => ServerFailure(reason ?? message);
}

final class UnknownNetworkException extends NetworkException {
  const UnknownNetworkException(super.message, [super.statusCode]);

  @override
  Failure toFailure([String? reason]) =>
      UnknownNetworkFailure(reason ?? message);
}

final class SystemMaintenanceException extends ServerException {
  const SystemMaintenanceException(super.message, [super.statusCode]);

  @override
  Failure toFailure([String? reason]) => ServerFailure(reason ?? message);
}

final class PermissionDeniedException extends ServerException {
  const PermissionDeniedException(super.message, [super.statusCode]);

  @override
  Failure toFailure([String? reason]) => PermissionFailure(reason ?? message);
}
