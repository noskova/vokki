import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokki/src/constants/app_sizes.dart';
import 'package:vokki/src/features/flashcards/domain/flash_card.dart';

/// Used to show a single flashCard inside a card.
class FlashCardWidget extends ConsumerWidget {
  const FlashCardWidget({
    super.key,
    required this.flashCard,
    this.onPressed,
  });
  final FlashCard flashCard;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(flashCard.word,
                  style: Theme.of(context).textTheme.titleLarge),
              gapH8,
              Text(
                flashCard.translation['es'] ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
