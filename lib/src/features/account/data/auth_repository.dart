// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:vokki/src/features/account/domain/app_user.dart';
import 'package:vokki/src/utils/in_memory_store.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository(
    this._auth,
  );
  final FirebaseAuth _auth;

  Future<void> signInWithEmailAndPassword(String email, String password) {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  Stream<AppUser?> authStateChanges() {
    return _auth.authStateChanges().map(_convertUser);
  }

  AppUser? get currentUser => _convertUser(_auth.currentUser);

  AppUser? _convertUser(User? user) {
    if (user != null) {
      return AppUser(
        uid: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '',
      );
    }
    return null;
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  final auth = AuthRepository(FirebaseAuth.instance);
  return auth;
}

// final authRepositoryProvider = Provider<AuthRepository>((ref) {
// });

final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});

// class FirebaseAuthRepository implements AuthRepository {
//   @override
//   Stream<AppUser?> authStateChanges() {
//     // TODO Implement
//     throw UnimplementedError();
//   }

//   @override
//   AppUser? get currentUser {
//     // TODO Implement
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> signInWithEmailAndPassword(
//     String email,
//     String password,
//   ) {
//     // TODO Implement
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> createUserWithEmailAndPassword(
//     String email,
//     String password,
//   ) {
//     // TODO Implement
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> signOut() {
//     // TODO Implement
//     throw UnimplementedError();
//   }
// }

// class FakeAuthRepository implements AuthRepository {
//   final _authState = InMemoryStore<AppUser?>(null);

//   @override
//   Stream<AppUser?> authStateChanges() => _authState.stream; // TODO Update
//   @override
//   AppUser? get currentUser => _authState.value; // TODO Update

//   @override
//   Future<void> signInWithEmailAndPassword(
//     String email,
//     String password,
//   ) async {
//     if (currentUser == null) {
//       _createNewUser(email);
//     }
//   }

//   @override
//   Future<void> createUserWithEmailAndPassword(
//       String email, String password) async {
//     if (currentUser == null) {
//       _createNewUser(email);
//     }
//   }

//   @override
//   Future<void> signOut() async {
//     // await Future.delayed(const Duration(milliseconds: 300));
//     // throw Exception('Sign out failed');
//     _authState.value = null;
//   }

//   void dispose() => _authState.close();

//   void _createNewUser(
//     String email, {
//     String? name,
//   }) {
//     _authState.value = AppUser(
//         uid: email.split('').reversed.join(),
//         email: email,
//         name: name ?? email);
//   }
// }
