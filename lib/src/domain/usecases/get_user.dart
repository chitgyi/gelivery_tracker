import 'package:gelivery_tracker/src/core/domain/use_case.dart';
import 'package:gelivery_tracker/src/core/utils/exceptions/db_exception.dart';
import 'package:gelivery_tracker/src/core/utils/exceptions/network_exception.dart';
import 'package:gelivery_tracker/src/core/utils/failures/network_failure.dart';
import 'package:gelivery_tracker/src/domain/entities/user_entity.dart';
import 'package:gelivery_tracker/src/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UseCase<Result<UserEntity>, GetUserParam>)
final class GetUser implements UseCase<Result<UserEntity>, GetUserParam> {
  final AuthRepo _authRepo;
  GetUser(this._authRepo);

  @override
  Future<Result<UserEntity>> call(GetUserParam param) async {
    try {
      UserEntity user = await _authRepo.getUser();
      final duration = DateTime.now().difference(user.expiredAt);
      if (duration.isNegative) {
        await _authRepo.refreshToken();
        user = await _authRepo.getUser();
      }
      return Success(user);
    } on DbException {
      return const Failed(SessionFailure('Session Expired'));
    } on NetworkException catch (e) {
      return Failed(e.toFailure());
    }
  }
}

class GetUserParam {
  const GetUserParam();
}
