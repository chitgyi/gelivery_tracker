import 'package:gelivery_tracker/src/data/mapper/user_mapper.dart';

abstract interface class UserLocalDataSource {
  Future<void> saveUser(UserMapper user);
  Future<UserMapper> getUser();
  Future<void> removeUser();
}
