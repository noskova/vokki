import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:vokki/src/constants/app_sizes.dart';
import 'package:vokki/src/features/flashcards/presentation/flash_card_new/flash_card_new_notifier.dart';
import 'package:vokki/src/localization/string_hardcoded.dart';

class FlashCardTextRecordScreen extends ConsumerStatefulWidget {
  const FlashCardTextRecordScreen({super.key});

  @override
  ConsumerState<FlashCardTextRecordScreen> createState() =>
      _FlashCardTextRecordScreenState();
}

class _FlashCardTextRecordScreenState
    extends ConsumerState<FlashCardTextRecordScreen> {
  final SpeechToText _speechToText = SpeechToText();

  bool _speechEnabled = false;
  String _wordsSpoken = "";

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = "${result.recognizedWords}";
    });
    ref.read(flashCardNewNotifierProvider.notifier).recordText(
          pronouncedWords: _wordsSpoken,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Speak to record a new flashcard'.hardcoded,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Sizes.p16),
              child: Text(
                _speechToText.isListening
                    ? 'listening...'.hardcoded
                    : _speechEnabled
                        ? 'Tap the microphone to start listening...'.hardcoded
                        : 'Speech not available'.hardcoded,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  _wordsSpoken,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _speechToText.isListening ? _stopListening : _startListening,
        tooltip: 'Listen'.hardcoded,
        child: Icon(
          _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
        ),
      ),
    );
  }
}
