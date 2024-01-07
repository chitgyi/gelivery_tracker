import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gelivery_tracker/flavors.dart';
import 'package:gelivery_tracker/src/data/network/api/rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkDIModule {
  @Named('base_url')
  String provideBaseUrl() => F.appFlavor.baseUrl;

  @lazySingleton
  RestClient provideRestClient(@Named('base_url') String baseUrl) => RestClient(
        Dio(
          BaseOptions(
            baseUrl: baseUrl,
            followRedirects: false,
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
            connectTimeout: const Duration(minutes: 1),
            receiveTimeout: const Duration(minutes: 1),
          ),
        )..interceptors.addAll([
            if (kDebugMode)
              PrettyDioLogger(
                requestBody: true,
                requestHeader: true,
              ),
          ]),
      );
}

extension on Flavor? {
  String get baseUrl {
    return switch (this) {
      Flavor.noneprod => 'https://dev.gigagates.com/qq-delivery-backend',
      _ => 'https://dev.gigagates.com/qq-delivery-backend',
    };
  }
}
