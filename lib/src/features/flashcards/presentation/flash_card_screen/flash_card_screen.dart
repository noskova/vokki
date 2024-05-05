import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokki/src/common_widgets/async_value_widget.dart';
import 'package:vokki/src/common_widgets/empty_placeholder_widget.dart';
import 'package:vokki/src/common_widgets/vokki_app_bar.dart';
import 'package:vokki/src/common_widgets/responsive_center.dart';
import 'package:vokki/src/common_widgets/responsive_two_columns_layout.dart';
import 'package:vokki/src/constants/app_sizes.dart';
import 'package:vokki/src/features/flashcards/data/flash_cards_repository.dart';
import 'package:vokki/src/features/flashcards/domain/flash_card.dart';
import 'package:vokki/src/localization/string_hardcoded.dart';

/// Shows the product page for a given product ID.
class FlashCardScreen extends StatelessWidget {
  const FlashCardScreen({super.key, required this.flashCardId});
  final FlashCardID flashCardId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VokkiAppBar(),
      body: Consumer(
        builder: (context, ref, _) {
          final flashCardValue =
              ref.watch(flashCardsStreamProvider(flashCardId));
          return AsyncValueWidget<FlashCard?>(
            value: flashCardValue,
            data: (flashCard) => flashCard == null
                ? EmptyPlaceholderWidget(
                    message: 'Flashcard not found'.hardcoded,
                  )
                : CustomScrollView(
                    slivers: [
                      ResponsiveSliverCenter(
                        padding: const EdgeInsets.all(Sizes.p16),
                        child: FlashCardDetails(flashCard: flashCard),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

/// Shows all the product details along with actions to:
/// - leave a review
/// - add to cart
class FlashCardDetails extends ConsumerWidget {
  const FlashCardDetails({super.key, required this.flashCard});
  final FlashCard flashCard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveTwoColumnLayout(
      startContent: Card(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Text(flashCard.word,
              style: Theme.of(context).textTheme.titleLarge),
        ),
      ),
      spacing: Sizes.p16,
      endContent: Card(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text(flashCard.word,
              //     style: Theme.of(context).textTheme.titleLarge),
              // gapH8,
              Text(flashCard.translation,
                  style: Theme.of(context).textTheme.bodySmall),
              // Only show average if there is at least one rating
            ],
          ),
        ),
      ),
    );
  }
}
