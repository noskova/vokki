import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokki/src/constants/app_sizes.dart';
import 'package:vokki/src/features/flashcards/domain/flash_card.dart';

/// Used to show a single product inside a card.
class FlashCardCard extends ConsumerWidget {
  const FlashCardCard({super.key, required this.flashCard, this.onPressed});
  final FlashCard flashCard;
  final VoidCallback? onPressed;

  // * Keys for testing using find.byKey()
  static const flashCardKey = Key('flash-card');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        key: flashCardKey,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                flashCard.word,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
