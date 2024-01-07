import 'package:gelivery_tracker/src/data/mapper/user_mapper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
final class LoginResponse {
  @JsonKey(name: 'data', fromJson: _dataFromJson, toJson: _dataToJson)
  final UserMapper user;

  LoginResponse(this.user);

  static UserMapper _dataFromJson(Map<String, dynamic> json) {
    return UserMapper.fromJson(json);
  }

  static Map<String, dynamic> _dataToJson(UserMapper userMapper) {
    return {
      'data': userMapper.toJson(),
    };
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
