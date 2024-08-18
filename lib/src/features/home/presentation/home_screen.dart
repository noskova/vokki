import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:go_router/go_router.dart';
import 'package:vokki/src/common_widgets/error_message_widget.dart';
import 'package:vokki/src/common_widgets/primary_button.dart';
import 'package:vokki/src/common_widgets/vokki_app_bar.dart';
import 'package:vokki/src/constants/app_sizes.dart';
import 'package:vokki/src/features/flashcards/domain/flash_card.dart';
import 'package:vokki/src/features/flashcards/presentation/flash_cards_list/flash_cards_search_query_notifier.dart';
import 'package:vokki/src/localization/string_hardcoded.dart';
import 'package:vokki/src/routing/app_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: VokkiAppBar(
        showLogo: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => context.goNamed(
      //     AppRoute.flashCardNew.name,
      //   ),
      //   child: const Icon(Icons.add),
      // ),
      //body: const FlashCardsScreen(),
      body: FlashCardsScreen(),
    );
  }
}

class FlashCardsScreen extends ConsumerStatefulWidget {
  const FlashCardsScreen({super.key});

  @override
  ConsumerState<FlashCardsScreen> createState() => _FlashCardsScreenState();
}

class _FlashCardsScreenState extends ConsumerState<FlashCardsScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.76);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Welcome to Vokki app'.hardcoded),
    );
  }
  //   final flashCardsListValue = ref.watch(flashCardsSearchResultsProvider);
  //   final error = flashCardsListValue.error;
  //   if (error != null) {
  //     return Center(
  //       child: ErrorMessageWidget(error.toString()),
  //     );
  //   }
  //   final flashCards = flashCardsListValue.value;
  //   if (flashCards == null) {
  //     return const Center(
  //       child: CircularProgressIndicator(),
  //     );
  //   }

  //   if (flashCards.isEmpty) {
  //     return Center(
  //       child: Text('Please tap plus to add a flash card'.hardcoded),
  //     );
  //   }

  //   return ListView(
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.all(Sizes.p16),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text('Flashcards hunted: ${flashCards.length}'),
  //             const Text('Learned: 100%'),
  //           ],
  //         ),
  //       ),
  //       gapH24,
  //       CarouselWidget(
  //         pageController: _pageController,
  //         flashCards: flashCards,
  //       )
  //     ],
  //   );
  // }
}

class CarouselWidget extends StatelessWidget {
  final PageController _pageController;
  final List<FlashCard>? _flashCards;
  const CarouselWidget({
    required PageController pageController,
    required List<FlashCard>? flashCards,
    super.key,
  })  : _pageController = pageController,
        _flashCards = flashCards;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: PageView(
            controller: _pageController,
            children: _flashCards
                    ?.map(
                      (flashCard) =>
                          CarouselElementWidget(flashCard: flashCard),
                    )
                    .toList() ??
                [],
          ),
        ),
        const SizedBox(height: Sizes.p12),
      ],
    );
  }
}

enum TtsState { playing, stopped, paused, continued }

class CarouselElementWidget extends StatefulWidget {
  final FlashCard _flashCard;
  const CarouselElementWidget({required FlashCard flashCard, super.key})
      : _flashCard = flashCard;

  @override
  State<CarouselElementWidget> createState() => _CarouselElementWidgetState();
}

class _CarouselElementWidgetState extends State<CarouselElementWidget> {
  late FlutterTts flutterTts;

  String? language;
  String? engine;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;

  String? _newVoiceText;

  TtsState ttsState = TtsState.stopped;

  bool get isPlaying => ttsState == TtsState.playing;
  bool get isStopped => ttsState == TtsState.stopped;
  bool get isPaused => ttsState == TtsState.paused;
  bool get isContinued => ttsState == TtsState.continued;

  bool showTranslation = false;

  @override
  initState() {
    _loadWord(widget._flashCard.word);
    super.initState();
    initTts();
  }

  dynamic initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    if (Platform.isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setPauseHandler(() {
      setState(() {
        print("Paused");
        ttsState = TtsState.paused;
      });
    });

    flutterTts.setContinueHandler(() {
      setState(() {
        print("Continued");
        ttsState = TtsState.continued;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future<void> _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future<void> _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future<void> _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }

  Future<void> _speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (_newVoiceText != null) {
      if (_newVoiceText!.isNotEmpty) {
        await flutterTts.speak(_newVoiceText!);
      }
    }
  }

  Future<void> _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future<void> _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  void _loadWord(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

  void _showTranslation() {
    setState(() {
      showTranslation = !showTranslation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.p8),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.volume_up_outlined, size: Sizes.p40),
                  onPressed: () {
                    _speak();
                  },
                ),
                gapH16,
                Text(
                  widget._flashCard.word,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                gapH16,
                Wrap(
                  children: [
                    showTranslation
                        ? TextButton(
                            onPressed: () => _showTranslation(),
                            child: Text(
                              widget._flashCard.translation,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          )
                        : PrimaryButton(
                            text: 'Show translation'.hardcoded,
                            onPressed: () => _showTranslation(),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
