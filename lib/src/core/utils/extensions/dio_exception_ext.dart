import 'package:dio/dio.dart';
import 'package:gelivery_tracker/src/core/utils/exceptions/network_exception.dart';

extension DioExceptionExt on DioException {
  NetworkException toNetworkException() {
    return switch (type) {
      DioExceptionType.badResponse => const BadRequestException('Bad Request'),
      DioExceptionType.badCertificate =>
        UnknownNetworkException(message ?? 'Bad Certificate'),
      DioExceptionType.cancel =>
        const UnknownNetworkException('Cancel Request'),
      DioExceptionType.connectionError =>
        const InternetConnectionException('Connection Error'),
      DioExceptionType.receiveTimeout =>
        const TimeoutException('Receive Timeout'),
      DioExceptionType.sendTimeout => const TimeoutException('Send Time Out'),
      DioExceptionType.unknown =>
        const UnAuthorizedException('An error occurred!'),
      DioExceptionType _ => const UnknownNetworkException(
          'An error occurred while retrieving data',
        )
    };
  }
}
