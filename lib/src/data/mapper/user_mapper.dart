import 'package:gelivery_tracker/src/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_mapper.g.dart';

@JsonSerializable()
final class UserMapper {
  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @JsonKey(
    name: 'expires_in',
    fromJson: durationFromJson,
    toJson: durationToJson,
  )
  final DateTime expiredAt;

  UserMapper(
    this.accessToken,
    this.refreshToken,
    this.expiredAt,
  );

  factory UserMapper.fromJson(Map<String, dynamic> json) =>
      _$UserMapperFromJson(json);
  Map<String, dynamic> toJson() => _$UserMapperToJson(this);

  static DateTime durationFromJson(int mms) => DateTime.now()
    ..add(
      Duration(milliseconds: mms),
    );
  static int durationToJson(DateTime dateTime) =>
      dateTime.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch;

  UserEntity toEntity() => UserEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiredAt: expiredAt,
      );
}
