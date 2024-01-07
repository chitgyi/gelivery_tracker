import 'package:gelivery_tracker/src/core/domain/use_case.dart';
import 'package:gelivery_tracker/src/core/utils/exceptions/network_exception.dart';
import 'package:gelivery_tracker/src/domain/entities/user_entity.dart';
import 'package:gelivery_tracker/src/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UseCase<Result<UserEntity>, LoginParam>)
final class Login implements UseCase<Result<UserEntity>, LoginParam> {
  final AuthRepo _authRepo;
  Login(this._authRepo);

  @override
  Future<Result<UserEntity>> call(LoginParam param) async {
    try {
      final user = await _authRepo.login(param.username, param.password);
      return Success(user);
    } on NetworkException catch (e) {
      return Failed(e.toFailure());
    }
  }
}

class LoginParam {
  final String username;
  final String password;
  const LoginParam(
    this.username,
    this.password,
  );
}
