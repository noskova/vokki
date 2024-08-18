import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokki/src/features/authentication/data/secure_storage_service.dart';
import 'package:vokki/src/features/authentication/data/token_repository.dart';
import 'package:vokki/src/features/authentication/data/user_repository.dart';
import 'package:vokki/src/utils/in_memory_store.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

class AuthRepository {
  final TokenRepository tokenRepository;
  final UserRepository userRepository;
  final SecureStorageService secureStorageService;

  AuthRepository(
    this.tokenRepository,
    this.userRepository,
    this.secureStorageService,
  );

  final _authState = InMemoryStore<AuthStatus?>(null);

  Stream<AuthStatus?> authStateChanges() =>
      _authState.stream; // TODO: Implementation

  AuthStatus? get currentAuthStatus => _authState.value; // TODO: Implementation

  Future<void> checkAuthenticationStatus() async {
    try {
      final bool hasToken = await secureStorageService.hasToken() ?? false;
      hasToken
          ? _authState.value = AuthStatus.authenticated
          : _authState.value = AuthStatus.unauthenticated;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      final userToken = await tokenRepository.createAccessToken(
        username: email,
        password: password,
      );
      if (userToken == null) {
        // TODO: Implement error handling
        throw Exception('Failed to sign in. User token is null');
      }

      setToken(userToken.token);
      checkAuthenticationStatus();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String confirmPassword) async {
    try {
      await userRepository.createUser(
        username: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      signInWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getToken() async {
    try {
      final hasToken = await secureStorageService.hasToken() ?? false;
      if (hasToken) {
        return secureStorageService.getToken();
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setToken(String token) async {
    try {
      secureStorageService.persistToken(token);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      secureStorageService.deleteToken();
      checkAuthenticationStatus();
    } catch (e) {
      rethrow;
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final tokenRepository = ref.watch(tokenRepositoryProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  final secureStorageService = ref.watch(secureStorageServiceProvider);
  return AuthRepository(
    tokenRepository,
    userRepository,
    secureStorageService,
  );
});

final authStateChangesProvider = StreamProvider.autoDispose<AuthStatus?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
