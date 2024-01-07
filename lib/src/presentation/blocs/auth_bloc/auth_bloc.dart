import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelivery_tracker/src/core/domain/use_case.dart';
import 'package:gelivery_tracker/src/domain/entities/user_entity.dart';
import 'package:gelivery_tracker/src/domain/usecases/get_user.dart';
import 'package:gelivery_tracker/src/domain/usecases/logout.dart';
import 'package:gelivery_tracker/src/presentation/blocs/auth_bloc/auth_state.dart';
import 'package:injectable/injectable.dart';

@injectable
final class AuthBloc extends Cubit<AuthState> {
  final UseCase<Result<UserEntity>, GetUserParam> _getUser;
  final UseCase<Result<void>, LogoutParam> _logout;
  AuthBloc(this._getUser, this._logout) : super(const AuthCheckingState());

  Future<bool> checkAuthState() async {
    final result = await _getUser(const GetUserParam());
    return switch (result) {
      Success _ => true,
      _ => false,
    };
  }

  void logout() {
    _logout(const LogoutParam());
  }
}
