/// Simple class representing the user UID and email.
class AppUser {
  const AppUser({
    required this.uid,
    required this.email,
    required this.name,
  });
  final String uid;
  final String email;
  final String name;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.uid == uid &&
        other.email == email &&
        other.name == name;
  }

  @override
  int get hashCode => uid.hashCode ^ email.hashCode ^ name.hashCode;

  @override
  String toString() => 'AppUser(uid: $uid, email: $email, name: $name)';
}
