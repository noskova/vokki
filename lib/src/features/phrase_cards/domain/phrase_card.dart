import 'package:equatable/equatable.dart';

/// * The product identifier is an important concept and can have its own type.
typedef PhraseCardID = String;

/// Class representing a product.
class PhraseCard extends Equatable {
  const PhraseCard({
    required this.id,
    required this.phrase,
    required this.translation,
  });

  /// Unique product id
  final PhraseCardID id;
  final String phrase;
  final String translation;

  factory PhraseCard.fromMap(Map<String, dynamic> map) {
    return PhraseCard(
      id: map['id'] as String,
      phrase: map['phrase'] as String,
      translation: map['translation'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'phrase': phrase,
        'translation': translation,
      };

  PhraseCard copyWith({
    PhraseCardID? id,
    String? phrase,
    String? translation,
  }) {
    return PhraseCard(
      id: id ?? this.id,
      phrase: phrase ?? this.phrase,
      translation: translation ?? this.translation,
    );
  }

  @override
  List<Object?> get props => [
        id,
        phrase,
        translation,
      ];

  @override
  bool? get stringify => true;
}
