// import 'package:riverpod_annotation/riverpod_annotation.dart';

// import 'package:vokki/src/features/flashcards/data/flash_cards_repository.dart';
// import 'package:vokki/src/features/flashcards/domain/flash_card.dart';

// part 'flash_card_screen_controller.g.dart';

// @riverpod
// class FlashCardScreenController extends _$FlashCardScreenController {
//   @override
//   FutureOr<void> build() async {
//     //nothing to do here
//   }

//   Future<void> delete(FlashCardID flashCardId) async {
//     final flashCardsRepository = ref.read(flashCardsRepositoryProvider);
//     state = const AsyncValue<void>.loading();
//     state = await AsyncValue.guard(() async {
//       await flashCardsRepository.deleteFlashCard(flashCardId);
//     });
//   }
// }
