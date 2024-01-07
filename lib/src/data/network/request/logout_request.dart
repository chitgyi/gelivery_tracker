import 'package:json_annotation/json_annotation.dart';

part 'logout_request.g.dart';

/// Note: API will fail if request body not included. That's why I am passing key -> value object

@JsonSerializable()
final class LogoutRequest {
  final String key;
  final String value;
  const LogoutRequest(this.key, this.value);

  factory LogoutRequest.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LogoutRequestToJson(this);
}
