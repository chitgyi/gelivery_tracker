final class UserEntity {
  final String accessToken;
  final String refreshToken;
  final DateTime expiredAt;

  UserEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.expiredAt,
  });
}
