import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokki/src/features/authentication/domain/user_token.dart';
import 'package:vokki_openapi/vokki_openapi.dart';

class TokenRepository {
  final AuthApi authApi;
  TokenRepository(this.authApi);

  Future<UserToken?> createAccessToken({
    required String username,
    required String password,
  }) async {
    try {
      final ServicesCredentialsBuilder credentialsBuilder =
          ServicesCredentialsBuilder()
            ..email = username
            ..password = password;

      final ServicesCredentials serviceCreds = ServicesCredentials(
        (b) => b
          ..email = credentialsBuilder.email
          ..password = credentialsBuilder.password,
      );

      final response = await authApi.loginPost(credentials: serviceCreds);

      if (response.data != null &&
          response.data!.token != null &&
          response.data!.tokenType != null) {
        return UserToken(
          token: response.data!.token!,
          tokenType: response.data!.tokenType!,
        );
      }

      return null;
    } catch (e) {
      rethrow;
    }
  }
}

final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  final authApi = VokkiOpenapi().getAuthApi();
  return TokenRepository(authApi);
});
