import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokki/src/constants/test_words.dart';
import 'package:vokki/src/features/words/domain/word.dart';

class WordsRepository {
  final _words = kTestWords;

  List<Word> getWordsList() {
    return _words;
  }

  Word? getWord(String id) {
    return _words.firstWhere(
      (word) => word.id == id,
    );
  }

  Future<List<Word>> fetchWordsList() {
    return Future.value(_words);
  }

  Stream<List<Word>> watchWordsList() {
    return Stream.value(_words);
  }

  Stream<Word?> watchWord(String id) {
    return watchWordsList().map(
      (words) => words.firstWhere(
        (word) => word.id == id,
      ),
    );
  }
}

final wordsRepositoryProvider = Provider<WordsRepository>((ref) {
  return WordsRepository();
});
