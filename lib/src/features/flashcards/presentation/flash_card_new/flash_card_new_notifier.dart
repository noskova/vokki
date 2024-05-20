import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flash_card_new_notifier.g.dart';

@riverpod
class FlashCardNewNotifier extends _$FlashCardNewNotifier {
  @override
  String build() {
    return '';
  }

  Future<void> scanText({required InputImage inputImage}) async {
    final textRecognizer = TextRecognizer();
    try {
      final recognizedText = await textRecognizer.processImage(inputImage);

      updateState(recognizedText.text);
    } catch (e) {
      updateState('');
    } finally {
      textRecognizer.close();
    }
  }

  Future<void> recordText({required String pronouncedWords}) async {
    updateState(pronouncedWords);
  }

  void updateState(String text) {
    state = text;
  }
}
