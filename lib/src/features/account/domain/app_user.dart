typedef UserID = String;

class AppUser {
  const AppUser({
    required this.uid,
    required this.email,
    this.emailVerified = false,
  });
  final UserID uid;
  final String? email;
  final bool emailVerified;

  Future<void> sendEmailVerification() async {
    // no-op - implemented by subclasses
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.uid == uid &&
        other.email == email &&
        other.emailVerified == emailVerified;
  }

  @override
  int get hashCode => uid.hashCode ^ email.hashCode ^ emailVerified.hashCode;

  @override
  String toString() =>
      'AppUser(uid: $uid, email: $email, emailVerified: $emailVerified)';
}
