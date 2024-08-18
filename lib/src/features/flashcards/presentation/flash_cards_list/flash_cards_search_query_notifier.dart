// import 'dart:async';

// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:vokki/src/features/account/data/auth_repository.dart';
// import 'package:vokki/src/features/flashcards/data/flash_cards_search_repository.dart';
// import 'package:vokki/src/features/flashcards/domain/flash_card.dart';

// part 'flash_cards_search_query_notifier.g.dart';

// /// A simple notifier class to keep track of the search query
// @riverpod
// class FlashCardsSearchQueryNotifier extends _$FlashCardsSearchQueryNotifier {
//   /// Used to debounce the input queries
//   final _searchQueryController = StreamController<String>();
//   late final StreamSubscription<String> _subscription;

//   @override
//   String build() {
//     // debounce the inputs
//     _subscription = _searchQueryController.stream
//         .debounceTime(const Duration(milliseconds: 200))
//         .listen(_updateState);
//     // don't forget to close the StreamController on dispose
//     ref.onDispose(() {
//       _searchQueryController.close();
//       _subscription.cancel();
//     });
//     // by default, return an empty query
//     return '';
//   }

//   void _updateState(String query) {
//     // only update the state once the query has been debounced
//     state = query;
//   }

//   void setQuery(String query) {
//     // rather than setting the state directly, add the query to the sink so it
//     // can be debounced
//     // debugPrint('query = $query');
//     _searchQueryController.sink.add(query);
//   }
// }

// /// A provider that returns the search results for the current search query
// @riverpod
// Future<List<FlashCard>> flashCardsSearchResults(
//     FlashCardsSearchResultsRef ref) {
//   final authRepository = ref.watch(authRepositoryProvider);

//   final user = authRepository.currentUser;
//   final searchQuery = ref.watch(flashCardsSearchQueryNotifierProvider);
//   return ref.watch(flashCardsListSearchProvider(searchQuery, user?.uid).future);
// }
