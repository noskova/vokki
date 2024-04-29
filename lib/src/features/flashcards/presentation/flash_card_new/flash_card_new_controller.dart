import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vokki/src/features/flashcards/data/flash_cards_repository.dart';

part 'flash_card_new_controller.g.dart';

@riverpod
class FlashCardNewController extends _$FlashCardNewController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  // TODO id doesn't make sense here since it should be generated in Firebase
  Future<bool> submit({
    required String id,
    required String word,
    required String translation,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _newCard(id, word, translation));
    return state.hasError == false;
  }

  Future<void> _newCard(String id, String word, String translation) async {
    final wordCardsRepository = ref.read(flashCardsRepositoryProvider);
    return wordCardsRepository.createFlashCard(id, word, translation);
  }
}
