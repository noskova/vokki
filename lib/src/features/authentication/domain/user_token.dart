import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_token.freezed.dart';

@freezed
class UserToken with _$UserToken {
  const factory UserToken({
    required String token,
    required String tokenType,
  }) = _UserToken;
}
