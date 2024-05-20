import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Scaffold(
      appBar: const VokkiAppBar(
        showLogo: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed(
          AppRoute.flashCardNew.name,
        ),
        child: const Icon(Icons.add),
      ),
      //body: const FlashCardsScreen(),
      body: const FlashCardsScreen(),
    );
  }
}

class FlashCardsScreen extends ConsumerStatefulWidget {
  const FlashCardsScreen({super.key});

  @override
  ConsumerState<FlashCardsScreen> createState() => _FlashCardsScreenState();
}

class _FlashCardsScreenState extends ConsumerState<FlashCardsScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.88);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final flashCardsListValue = ref.watch(flashCardsSearchResultsProvider);
    final error = flashCardsListValue.error;
    if (error != null) {
      return Center(
        child: ErrorMessageWidget(error.toString()),
      );
    }
    final flashCards = flashCardsListValue.value;
    if (flashCards == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (flashCards.isEmpty) {
      return Center(
        child: Text('Please tap plus to add a flash card'.hardcoded),
      );
    }

    return CarouselWidget(
      pageController: _pageController,
      flashCards: flashCards,
    );
  }
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
        const SizedBox(height: 10.0),
      ],
    );
  }
}

class CarouselElementWidget extends StatelessWidget {
  final FlashCard _flashCard;
  const CarouselElementWidget({
    required FlashCard flashCard,
    super.key,
  }) : _flashCard = flashCard;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  _flashCard.word,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                gapH16,
                IconButton(
                  icon: const Icon(Icons.volume_up_outlined, size: Sizes.p40),
                  onPressed: () {},
                ),
                gapH16,
                Wrap(
                  children: [
                    PrimaryButton(
                      onPressed: () {},
                      text: 'Show translation'.hardcoded,
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
