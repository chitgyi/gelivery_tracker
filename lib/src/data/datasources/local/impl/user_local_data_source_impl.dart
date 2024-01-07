import 'dart:convert';

import 'package:gelivery_tracker/src/core/utils/exceptions/db_exception.dart';
import 'package:gelivery_tracker/src/data/datasources/local/user_local_data_source.dart';
import 'package:gelivery_tracker/src/data/mapper/user_mapper.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: UserLocalDataSource)
final class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences _sharedPreferences;
  UserLocalDataSourceImpl(this._sharedPreferences);

  static const userKey = 'user';

  @override
  Future<UserMapper> getUser() async {
    final userString = _sharedPreferences.getString(userKey);
    if (userString == null) throw DbException('No user found');
    return UserMapper.fromJson(jsonDecode(userString));
  }

  @override
  Future<void> saveUser(UserMapper user) async {
    await _sharedPreferences.setString(userKey, jsonEncode(user.toJson()));
  }

  @override
  Future<void> removeUser() async {
    await _sharedPreferences.remove(userKey);
  }
}
