import 'package:equatable/equatable.dart';

/// * The Flashcard identifier is an important concept and can have its own type.
typedef FlashCardID = String;

/// Class representing a product.
class FlashCard extends Equatable {
  const FlashCard({
    required this.id,
    required this.word,
    required this.translation,
    required this.uid,
  });

  /// Unique flsashcard id
  final FlashCardID id;
  final String word;
  final String translation;
  final String uid;

  factory FlashCard.fromMap(Map<String, dynamic> map) {
    return FlashCard(
      id: map['id'] as String,
      word: map['word'] as String,
      translation: map['translation'] ?? '',
      uid: map['uid'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'word': word,
        'translation': translation,
        'uid': uid,
      };

  FlashCard copyWith({
    FlashCardID? id,
    String? word,
    String? translation,
    String? uid,
  }) {
    return FlashCard(
      id: id ?? this.id,
      word: word ?? this.word,
      translation: translation ?? this.translation,
      uid: uid ?? this.uid,
    );
  }

  @override
  List<Object?> get props => [
        id,
        word,
        translation,
        uid,
      ];

  @override
  bool? get stringify => true;
}
