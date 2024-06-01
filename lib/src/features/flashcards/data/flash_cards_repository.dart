import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vokki/src/features/account/data/auth_repository.dart';
import 'package:vokki/src/features/flashcards/domain/flash_card.dart';
import 'package:vokki/src/features/flashcards/domain/native_language.dart';

part 'flash_cards_repository.g.dart';

class FlashCardsRepository {
  const FlashCardsRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String flashCardsPath() => 'flash_cards';
  static String flashCardPath(FlashCardID id) => 'flash_cards/$id';

  static String nativeLanguagePath() => 'user_native_language';

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

  Future<String?> fetchUserNativeLanguage(String uid) async {
    final ref = _nativeLanguageRef();
    final snapshot = await ref.get();

    final language = snapshot.docs.isNotEmpty
        ? snapshot.docs
            .map((element) => element.data())
            .firstWhere((element) => element.uid == uid)
            .language
            .toString()
        : null;

    return language;
  }

  Stream<FlashCard?> watchFlashCard(FlashCardID id) {
    final ref = _flashCardRef(id);
    return ref.snapshots().map((snapshot) => snapshot.data());
  }

  Future<int> newFlashCardId() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection(flashCardsPath()).get();

    // Find the highest ID
    int maxId = 0;
    for (var doc in querySnapshot.docs) {
      int docId = int.tryParse(doc.id) ?? 0;
      if (docId > maxId) {
        maxId = docId;
      }
    }

    return maxId + 1;
  }

  Future<void> createFlashCard(
    String word,
    String translation,
    String userId,
  ) async {
    final id = (await newFlashCardId()).toString();

    return _firestore.doc(flashCardPath(id)).set(
      {
        'id': id,
        'word': word,
        // TODO: add support for multiple translations
        'translation': translation,
        // TODO: add user id here
        'uid': userId,
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

  Query<NativeLanguage> _nativeLanguageRef() =>
      _firestore.collection(nativeLanguagePath()).withConverter(
            fromFirestore: (doc, _) => NativeLanguage.fromMap(doc.data()!),
            toFirestore: (NativeLanguage nativeLanguage, options) =>
                nativeLanguage.toMap(),
          );

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

@riverpod
Future<String?> userNativeLanguageFuture(
    UserNativeLanguageFutureRef ref, String userId) {
  final flashCardsRepository = ref.watch(flashCardsRepositoryProvider);
  return flashCardsRepository.fetchUserNativeLanguage(userId);
}
