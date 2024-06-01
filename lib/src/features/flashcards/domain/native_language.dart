import 'package:equatable/equatable.dart';

/// Class representing a product.
class NativeLanguage extends Equatable {
  const NativeLanguage({
    required this.uid,
    required this.language,
  });

  final String uid;
  final String language;

  factory NativeLanguage.fromMap(Map<String, dynamic> map) {
    return NativeLanguage(
      uid: map['uid'] as String,
      language: map['language'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'language': language,
      };

  NativeLanguage copyWith({
    String? uid,
    String? language,
  }) {
    return NativeLanguage(
      uid: uid ?? this.uid,
      language: language ?? this.language,
    );
  }

  @override
  List<Object?> get props => [
        language,
        uid,
      ];

  @override
  bool? get stringify => true;
}
