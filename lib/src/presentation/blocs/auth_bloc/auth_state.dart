import 'package:equatable/equatable.dart';

abstract interface class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

final class AuthCheckingState extends AuthState {
  const AuthCheckingState();
}

final class AuthResultState extends AuthState {
  final bool isLoggedIn;
  const AuthResultState(this.isLoggedIn);
}
