import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelivery_tracker/src/core/domain/use_case.dart';
import 'package:gelivery_tracker/src/core/utils/failures/other_failures.dart';
import 'package:gelivery_tracker/src/domain/entities/user_entity.dart';
import 'package:gelivery_tracker/src/domain/usecases/login.dart';
import 'package:gelivery_tracker/src/presentation/blocs/login_bloc/login_state.dart';
import 'package:injectable/injectable.dart';

@injectable
final class LoginCubit extends Cubit<LoginState> {
  final UseCase<Result<UserEntity>, LoginParam> _login;
  LoginCubit(this._login) : super(const LoginInitialState());

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool agreedTermsAndConditions = false;

  void login() async {
    print("login");
    emit(const LoginLoadingState());
    if (usernameController.text.trim().isEmpty) {
      return emit(const LoginFailedState(
        RequestFailure('Please enter username'),
      ));
    }

    if (passwordController.text.trim().isEmpty) {
      return emit(const LoginFailedState(
        RequestFailure('Please enter password'),
      ));
    }

    if (!agreedTermsAndConditions) {
      return emit(const LoginFailedState(
        RequestFailure('You need to agree terms & conditions'),
      ));
    }
    final result = await _login(
      LoginParam(
        usernameController.text,
        passwordController.text,
      ),
    );

    return switch (result) {
      Success _ => emit(const LoginSuccessState()),
      Failed(failure: final failure) => emit(LoginFailedState(failure))
    };
  }
}
