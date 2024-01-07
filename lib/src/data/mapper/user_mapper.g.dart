// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMapper _$UserMapperFromJson(Map<String, dynamic> json) => UserMapper(
      json['access_token'] as String,
      json['refresh_token'] as String,
      UserMapper.durationFromJson(json['expires_in'] as int),
    );

Map<String, dynamic> _$UserMapperToJson(UserMapper instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': UserMapper.durationToJson(instance.expiredAt),
    };
