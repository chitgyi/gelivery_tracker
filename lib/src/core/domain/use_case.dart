import 'package:gelivery_tracker/src/core/utils/failures/failure.dart';

abstract interface class UseCase<T, P> {
  Future<T> call(P param);
}

final class NoParams {
  const NoParams();
}

sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

final class Failed<T> extends Result<T> {
  final Failure failure;
  const Failed(this.failure);
}
