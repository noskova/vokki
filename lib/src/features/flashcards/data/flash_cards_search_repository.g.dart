// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flash_cards_search_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flashCardsSearchRepositoryHash() =>
    r'cb58238d1037d610c76419c8defc62b6ec2631c9';

/// See also [flashCardsSearchRepository].
@ProviderFor(flashCardsSearchRepository)
final flashCardsSearchRepositoryProvider =
    Provider<FlashCardsSearchRepository>.internal(
  flashCardsSearchRepository,
  name: r'flashCardsSearchRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flashCardsSearchRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlashCardsSearchRepositoryRef = ProviderRef<FlashCardsSearchRepository>;
String _$flashCardsListSearchHash() =>
    r'c3f490cf10a1e33d23430fcf93e86a19e80fc321';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [flashCardsListSearch].
@ProviderFor(flashCardsListSearch)
const flashCardsListSearchProvider = FlashCardsListSearchFamily();

/// See also [flashCardsListSearch].
class FlashCardsListSearchFamily extends Family<AsyncValue<List<FlashCard>>> {
  /// See also [flashCardsListSearch].
  const FlashCardsListSearchFamily();

  /// See also [flashCardsListSearch].
  FlashCardsListSearchProvider call(
    String query,
  ) {
    return FlashCardsListSearchProvider(
      query,
    );
  }

  @override
  FlashCardsListSearchProvider getProviderOverride(
    covariant FlashCardsListSearchProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'flashCardsListSearchProvider';
}

/// See also [flashCardsListSearch].
class FlashCardsListSearchProvider
    extends AutoDisposeFutureProvider<List<FlashCard>> {
  /// See also [flashCardsListSearch].
  FlashCardsListSearchProvider(
    String query,
  ) : this._internal(
          (ref) => flashCardsListSearch(
            ref as FlashCardsListSearchRef,
            query,
          ),
          from: flashCardsListSearchProvider,
          name: r'flashCardsListSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$flashCardsListSearchHash,
          dependencies: FlashCardsListSearchFamily._dependencies,
          allTransitiveDependencies:
              FlashCardsListSearchFamily._allTransitiveDependencies,
          query: query,
        );

  FlashCardsListSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<FlashCard>> Function(FlashCardsListSearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FlashCardsListSearchProvider._internal(
        (ref) => create(ref as FlashCardsListSearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<FlashCard>> createElement() {
    return _FlashCardsListSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FlashCardsListSearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FlashCardsListSearchRef on AutoDisposeFutureProviderRef<List<FlashCard>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _FlashCardsListSearchProviderElement
    extends AutoDisposeFutureProviderElement<List<FlashCard>>
    with FlashCardsListSearchRef {
  _FlashCardsListSearchProviderElement(super.provider);

  @override
  String get query => (origin as FlashCardsListSearchProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
