import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokki/src/features/flashcards/presentation/flash_cards_list/flash_cards_search_query_notifier.dart';
import 'package:vokki/src/localization/string_hardcoded.dart';

/// Search field used to filter products by name
class FlashCardsSearchTextField extends ConsumerStatefulWidget {
  const FlashCardsSearchTextField({super.key});

  @override
  ConsumerState<FlashCardsSearchTextField> createState() =>
      _FlashCardsSearchTextFieldState();
}

class _FlashCardsSearchTextFieldState
    extends ConsumerState<FlashCardsSearchTextField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // See this article for more info about how to use [ValueListenableBuilder]
    // with TextField:
    // https://codewithandrea.com/articles/flutter-text-field-form-validation/
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _controller,
      builder: (context, value, _) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              enabled: true, // * enable search
              autofocus: false,
              style: Theme.of(context).textTheme.titleLarge,
              decoration: InputDecoration(
                hintText: 'Search flashcards'.hardcoded,
                suffixIcon: value.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          _controller.clear();
                          ref
                              .read(flashCardsSearchQueryNotifierProvider
                                  .notifier)
                              .setQuery('');
                        },
                        icon: const Icon(Icons.clear),
                      )
                    : null,
              ),
              onChanged: (text) => ref
                  .read(flashCardsSearchQueryNotifierProvider.notifier)
                  .setQuery(text),
            ),
          ),
        );
      },
    );
  }
}
