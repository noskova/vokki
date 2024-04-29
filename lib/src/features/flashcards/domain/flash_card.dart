import 'package:equatable/equatable.dart';

/// * The Flashcard identifier is an important concept and can have its own type.
typedef FlashCardID = String;

/// Class representing a product.
class FlashCard extends Equatable {
  const FlashCard({
    required this.id,
    required this.word,
    required this.translation,
  });

  /// Unique flsashcard id
  final FlashCardID id;
  final String word;
  final Map<String, String> translation;

  factory FlashCard.fromMap(Map<String, dynamic> map) {
    return FlashCard(
      id: map['id'] as String,
      word: map['word'] as String,
      translation: map['translation'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'word': word,
        'translation': translation,
      };

  FlashCard copyWith({
    FlashCardID? id,
    String? word,
    Map<String, String>? translation,
  }) {
    return FlashCard(
      id: id ?? this.id,
      word: word ?? this.word,
      translation: translation ?? this.translation,
    );
  }

  @override
  List<Object?> get props => [
        id,
        word,
        translation,
      ];

  @override
  bool? get stringify => true;
}
