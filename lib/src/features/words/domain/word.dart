class Word {
  const Word({
    required this.id,
    required this.word,
    required this.translation,
  });

  final String id;
  final String word;
  final String translation;

  @override
  String toString() {
    return 'Word(id: $id, word: $word, translation: $translation)';
  }

  @override
  int get hashCode {
    return id.hashCode ^ word.hashCode ^ translation.hashCode;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Word &&
        other.id == id &&
        other.word == word &&
        other.translation == translation;
  }

  Word copyWith({
    String? id,
    String? word,
    String? translation,
  }) {
    return Word(
      id: id ?? this.id,
      word: word ?? this.word,
      translation: translation ?? this.translation,
    );
  }
}
