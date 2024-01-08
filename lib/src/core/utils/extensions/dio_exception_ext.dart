import 'package:dio/dio.dart';
import 'package:gelivery_tracker/src/core/utils/exceptions/network_exception.dart';

extension DioExceptionExt on DioException {
  NetworkException toNetworkException() {
    return switch (type) {
      DioExceptionType.badCertificate =>
        UnknownNetworkException(message ?? 'Bad Certificate'),
      DioExceptionType.cancel =>
        const UnknownNetworkException('Cancel Request'),
      DioExceptionType.connectionError =>
        const InternetConnectionException('Connection Error'),
      DioExceptionType.receiveTimeout =>
        const TimeoutException('Receive Timeout'),
      DioExceptionType.sendTimeout => const TimeoutException('Send Time Out'),
      _ => switch (response?.statusCode) {
          400 => const BadRequestException('Bad Request'),
          429 => const UnAuthorizedException('Too many requests'),
          401 => const UnAuthorizedException('UnAuthorized'),
          403 => const PermissionDeniedException('Permission Denied'),
          500 || 501 => const ServerException('Server Error'),
          503 => const SystemMaintenanceException('Server Maintenance'),
          _ => const UnknownNetworkException('An error occurred'),
        }
    };
  }
}
