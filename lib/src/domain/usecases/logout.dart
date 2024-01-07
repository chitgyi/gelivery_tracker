import 'package:gelivery_tracker/src/core/domain/use_case.dart';
import 'package:gelivery_tracker/src/core/utils/exceptions/network_exception.dart';
import 'package:gelivery_tracker/src/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UseCase<Result<void>, LogoutParam>)
final class Logout implements UseCase<Result<void>, LogoutParam> {
  final AuthRepo _authRepo;
  Logout(this._authRepo);

  @override
  Future<Result<void>> call(LogoutParam param) async {
    try {
      await _authRepo.logout();
      return const Success(null);
    } on NetworkException catch (e) {
      return Failed(e.toFailure());
    }
  }
}

class LogoutParam {
  const LogoutParam();
}
