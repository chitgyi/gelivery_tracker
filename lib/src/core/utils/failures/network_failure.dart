import 'package:gelivery_tracker/src/core/utils/failures/failure.dart';

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = "Not Found"]);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure([super.message = "Failed to connect to"]);
}

class SessionFailure extends Failure {
  const SessionFailure([super.message = "Session timeout"]);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure([super.message = 'Connection time out!']);
}

class BadReqFailure extends Failure {
  const BadReqFailure([super.message = 'Bad request']);
}

class ServerFailure extends Failure {
  const ServerFailure([
    super.message = 'Something was wrong. We will get back soon!',
  ]);
}

class PermissionFailure extends Failure {
  const PermissionFailure([
    super.message = 'You have no access',
  ]);
}

class UnknownNetworkFailure extends Failure {
  const UnknownNetworkFailure([
    super.message = 'Something was wrong. We will get back soon!',
  ]);
}
