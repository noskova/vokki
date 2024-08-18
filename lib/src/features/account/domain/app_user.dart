import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required int? id,
    required String? email,
    required bool? activated,
  }) = _AppUser;
}
