// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flash_cards_search_query_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flashCardsSearchResultsHash() =>
    r'40933c6344191733a14efe20e681af2493cde44c';

/// A provider that returns the search results for the current search query
///
/// Copied from [flashCardsSearchResults].
@ProviderFor(flashCardsSearchResults)
final flashCardsSearchResultsProvider =
    AutoDisposeFutureProvider<List<FlashCard>>.internal(
  flashCardsSearchResults,
  name: r'flashCardsSearchResultsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flashCardsSearchResultsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlashCardsSearchResultsRef
    = AutoDisposeFutureProviderRef<List<FlashCard>>;
String _$flashCardsSearchQueryNotifierHash() =>
    r'e50c38868e8e82b1646e6a6dddfbf02cdbe1d288';

/// A simple notifier class to keep track of the search query
///
/// Copied from [FlashCardsSearchQueryNotifier].
@ProviderFor(FlashCardsSearchQueryNotifier)
final flashCardsSearchQueryNotifierProvider =
    AutoDisposeNotifierProvider<FlashCardsSearchQueryNotifier, String>.internal(
  FlashCardsSearchQueryNotifier.new,
  name: r'flashCardsSearchQueryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flashCardsSearchQueryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FlashCardsSearchQueryNotifier = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
