import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flash_card_text_scan_notifier.g.dart';

@riverpod
class FlashCardTextScanNotifier extends _$FlashCardTextScanNotifier {
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

  void updateState(String text) {
    state = text;
  }
}
