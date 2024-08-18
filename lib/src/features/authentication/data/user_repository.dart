import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokki_openapi/vokki_openapi.dart';

class UserRepository {
  final AuthApi authApi;
  UserRepository(this.authApi);

  Future<void> createUser({
    required String username,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final ModelsNewUserRequestBuilder newUserBuilder =
          ModelsNewUserRequestBuilder()
            ..email = username
            ..password = password
            ..confirmationPassword = confirmPassword;

      final ModelsNewUserRequest newUser = ModelsNewUserRequest((nu) => nu
        ..email = newUserBuilder.email
        ..password = newUserBuilder.password
        ..confirmationPassword = newUserBuilder.confirmationPassword);

      await authApi.registerPost(user: newUser);
    } catch (e) {
      rethrow;
    }
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final authApi = VokkiOpenapi().getAuthApi();
  return UserRepository(authApi);
});
