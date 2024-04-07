import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vokki/src/features/phrase_cards/data/phrase_cards_repository.dart';

part 'phrase_card_new_controller.g.dart';

@riverpod
class PhraseCardNewController extends _$PhraseCardNewController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }
  Future<bool> submit({
    required String phrase,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _newCard(phrase));
    return state.hasError == false;
  }

  Future<void> _newCard(String phrase) {
    final phraseCardsRepository = ref.read(phraseCardsRepositoryProvider);
    return phraseCardsRepository.newPhraseCard(phrase);
  }
}
