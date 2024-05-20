import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flash_card_text_record_notifier.g.dart';

@riverpod
class FlashCardTextRecordNotifier extends _$FlashCardTextRecordNotifier {
  @override
  String build() {
    return '';
  }

  Future<void> recordText({required String pronouncedWords}) async {
    updateState(pronouncedWords);
  }

  void updateState(String text) {
    state = text;
  }
}
