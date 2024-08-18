// import 'dart:async';

// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:vokki/src/features/flashcards/data/flash_cards_repository.dart';

// part 'flash_card_new_controller.g.dart';

// @riverpod
// class FlashCardNewController extends _$FlashCardNewController {
//   @override
//   FutureOr<void> build() {
//     // nothing to do
//   }

//   // TODO: add user id here
//   Future<bool> submit({
//     required String word,
//     required String translation,
//     required String userId,
//   }) async {
//     state = const AsyncValue.loading();
//     state = await AsyncValue.guard(() => _newCard(word, translation, userId));
//     return state.hasError == false;
//   }

//   Future<void> _newCard(String word, String translation, String userId) async {
//     final flashCardsRepository = ref.read(flashCardsRepositoryProvider);
//     return flashCardsRepository.createFlashCard(word, translation, userId);
//   }
// }
