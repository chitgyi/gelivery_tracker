import 'package:equatable/equatable.dart';
import 'package:gelivery_tracker/src/core/utils/failures/failure.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

final class LoginInitialState extends LoginState {
  const LoginInitialState();

  @override
  List<Object?> get props => [];
}

final class LoginSuccessState extends LoginState {
  const LoginSuccessState();

  @override
  List<Object?> get props => [];
}

final class LoginFailedState extends LoginState {
  final Failure failure;
  const LoginFailedState(this.failure);
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}
