import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vokki/src/features/phrase_cards/domain/phrase_card.dart';

part 'phrase_cards_repository.g.dart';

class PhraseCardsRepository {
  const PhraseCardsRepository(this._firestore);
  final FirebaseFirestore _firestore;

  Future<List<PhraseCard>> fetchPhraseCardsList() {
    return Future.value([]);
  }

  Stream<List<PhraseCard>> watchPhraseCardsList() {
    return Stream.value([]);
  }

  Stream<PhraseCard?> watchPhraseCard(PhraseCardID id) {
    return Stream.value(null);
  }

  Future<List<PhraseCard>> searchPhraseCards(String query) {
    return Future.value([]);
  }

  Future<void> newPhraseCard(String phrase) {
    return _firestore
        .collection('PhraseCards')
        .add({'phrase': phrase, 'translation': ''});
  }
}

@Riverpod(keepAlive: true)
PhraseCardsRepository phraseCardsRepository(PhraseCardsRepositoryRef ref) {
  return PhraseCardsRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<PhraseCard>> phraseCardsListStream(PhraseCardsListStreamRef ref) {
  final cardsRepository = ref.watch(phraseCardsRepositoryProvider);
  return cardsRepository.watchPhraseCardsList();
}

@riverpod
Future<List<PhraseCard>> phraseCardsListFuture(PhraseCardsListFutureRef ref) {
  final phraseCardsRepository = ref.watch(phraseCardsRepositoryProvider);
  return phraseCardsRepository.fetchPhraseCardsList();
}

@riverpod
Stream<PhraseCard?> phraseCard(PhraseCardRef ref, PhraseCardID id) {
  final phraseCardsRepository = ref.watch(phraseCardsRepositoryProvider);
  return phraseCardsRepository.watchPhraseCard(id);
}

@riverpod
Future<List<PhraseCard>> phraseCardListSearch(
    PhraseCardListSearchRef ref, String query) async {
  final link = ref.keepAlive();
  // a timer to be used by the callbacks below
  Timer? timer;
  // When the provider is destroyed, cancel the http request and the timer
  ref.onDispose(() {
    timer?.cancel();
  });
  // When the last listener is removed, start a timer to dispose the cached data
  ref.onCancel(() {
    // start a 30 second timer
    timer = Timer(const Duration(seconds: 30), () {
      // dispose on timeout
      link.close();
    });
  });
  // If the provider is listened again after it was paused, cancel the timer
  ref.onResume(() {
    timer?.cancel();
  });
  final phraseCardsRepository = ref.watch(phraseCardsRepositoryProvider);
  return phraseCardsRepository.searchPhraseCards(query);
}
