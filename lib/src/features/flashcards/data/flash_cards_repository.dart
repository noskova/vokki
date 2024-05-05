import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vokki/src/features/flashcards/domain/flash_card.dart';

part 'flash_cards_repository.g.dart';

class FlashCardsRepository {
  const FlashCardsRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String flashCardsPath() => 'flash_cards';
  static String flashCardPath(FlashCardID id) => 'flash_cards/$id';

  Future<List<FlashCard>> fetchFlashCardsList() async {
    final ref = _flashCardsRef();
    final snapshot = await ref.get();
    return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }

  Stream<List<FlashCard>> watchFlashCardsList() {
    final ref = _flashCardsRef();
    return ref.snapshots().map((snapshot) =>
        snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList());
  }

  Future<FlashCard?> fetchFlashCard(FlashCardID id) async {
    final ref = _flashCardRef(id);
    final snapshot = await ref.get();
    return snapshot.data();
  }

  Stream<FlashCard?> watchFlashCard(FlashCardID id) {
    final ref = _flashCardRef(id);
    return ref.snapshots().map((snapshot) => snapshot.data());
  }

  Future<void> createFlashCard(
      FlashCardID id, String word, String translation) {
    return _firestore.doc(flashCardPath(id)).set(
      {
        'id': id,
        'word': word,
        // TODO: add support for multiple translations
        'translation': translation,
        // TODO: add user id here
        'uid': '',
      },
      // use merge: true to keep old fields (if any)
      SetOptions(merge: true),
    );
  }

  Future<void> updateFlashCard(FlashCard flashCard) {
    final ref = _flashCardRef(flashCard.id);
    return ref.set(flashCard);
  }

  Future<void> deleteFlashCard(FlashCardID id) {
    return _firestore.doc(flashCardPath(id)).delete();
  }

  DocumentReference<FlashCard> _flashCardRef(FlashCardID id) =>
      _firestore.doc(flashCardPath(id)).withConverter(
            fromFirestore: (doc, _) => FlashCard.fromMap(doc.data()!),
            toFirestore: (FlashCard flashCard, options) => flashCard.toMap(),
          );

  Query<FlashCard> _flashCardsRef() => _firestore
      .collection(flashCardsPath())
      .withConverter(
        fromFirestore: (doc, _) => FlashCard.fromMap(doc.data()!),
        toFirestore: (FlashCard flashCard, options) => flashCard.toMap(),
      )
      .orderBy('id');

  // * Temporary search implementation.
  // * Note: this is quite inefficient as it pulls the entire product list
  // * and then filters the data on the client
  Future<List<FlashCard>> search(String query) async {
    // 1. Get all products from Firestore
    final flashCardsList = await fetchFlashCardsList();
    // 2. Perform client-side filtering
    return flashCardsList
        .where((flashCard) =>
            flashCard.word.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

@Riverpod(keepAlive: true)
FlashCardsRepository flashCardsRepository(FlashCardsRepositoryRef ref) {
  return FlashCardsRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<FlashCard>> flashCardsListStream(FlashCardsListStreamRef ref) {
  final flashCardsRepository = ref.watch(flashCardsRepositoryProvider);
  return flashCardsRepository.watchFlashCardsList();
}

@riverpod
Future<List<FlashCard>> flashCardsListFuture(FlashCardsListFutureRef ref) {
  final flashCardsRepository = ref.watch(flashCardsRepositoryProvider);
  return flashCardsRepository.fetchFlashCardsList();
}

@riverpod
Stream<FlashCard?> flashCardsStream(FlashCardsStreamRef ref, FlashCardID id) {
  final flashCardsRepository = ref.watch(flashCardsRepositoryProvider);
  return flashCardsRepository.watchFlashCard(id);
}

@riverpod
Future<FlashCard?> flashCardFuture(FlashCardFutureRef ref, FlashCardID id) {
  final flashCardsRepository = ref.watch(flashCardsRepositoryProvider);
  return flashCardsRepository.fetchFlashCard(id);
}
