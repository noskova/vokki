import 'dart:async';

import 'package:algolia/algolia.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vokki/env.dart';
import 'package:vokki/src/features/flashcards/data/flash_cards_repository.dart';
import 'package:vokki/src/features/flashcards/domain/flash_card.dart';

part 'flash_cards_search_repository.g.dart';

/// Class used to search flashCards using the Algolia Dart Client
class FlashCardsSearchRepository {
  const FlashCardsSearchRepository(this._algolia);
  final Algolia _algolia;

  /// Search for the given text an return a list of flashCards
  Future<List<FlashCard>> search(String text) async {
    // * Use the index name that is configured in the Algolia dashboard
    // * https://dashboard.algolia.com/apps/APP_ID/explorer/browse
    final index = _algolia.index('flash_cards_index');
    final query = index.query(text);
    final objects = await query.getObjects();
    return objects.hits.map((hit) => FlashCard.fromMap(hit.data)).toList();
  }
}

@Riverpod(keepAlive: true)
FlashCardsSearchRepository flashCardsSearchRepository(
    FlashCardsSearchRepositoryRef ref) {
  final algolia = Algolia.init(
    applicationId: Env.algoliaAppId,
    apiKey: Env.algoliaSearchKey,
  );
  return FlashCardsSearchRepository(algolia);
}

@riverpod
Future<List<FlashCard>> flashCardsListSearch(
    FlashCardsListSearchRef ref, String query) async {
  final link = ref.keepAlive();
  // a timer to be used by the callbacks below
  Timer? timer;
  // When the provider is destroyed, cancel the timer
  ref.onDispose(() {
    timer?.cancel();
  });
  // When the last listener is removed, start a timer to dispose the cached data
  ref.onCancel(() {
    // start a 30 second timer
    timer = Timer(const Duration(seconds: 30), () {
      // dispose on timeout
      link.close();
    });
  });
  // If the provider is listened again after it was paused, cancel the timer
  ref.onResume(() {
    timer?.cancel();
  });
  if (query.isNotEmpty) {
    // * if the query is not empty, use the search repository (one-time read)
    final searchRepository = ref.watch(flashCardsRepositoryProvider);
    return searchRepository.search(query);
  } else {
    // * otherwise, use the default stream provider (realtime data)
    return ref.watch(flashCardsListStreamProvider.future);
  }
}
