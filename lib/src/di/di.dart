import 'package:gelivery_tracker/src/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final _getIt = GetIt.instance;

T get<T extends Object>({
  String? instanceName,
  Type? type,
}) =>
    _getIt.get<T>(
      instanceName: instanceName,
      type: type,
    );

T set<T extends Object>(
  T instance, {
  String? instanceName,
}) =>
    _getIt.registerSingleton<T>(
      instance,
      instanceName: instanceName,
    );

@InjectableInit()
void configDependencies() => _getIt.init();
