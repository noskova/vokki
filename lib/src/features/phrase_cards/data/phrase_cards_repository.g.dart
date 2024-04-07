// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phrase_cards_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$phraseCardsRepositoryHash() =>
    r'f6cb28ef66c2dcf9d3b80c49c2ac646ec936da02';

/// See also [phraseCardsRepository].
@ProviderFor(phraseCardsRepository)
final phraseCardsRepositoryProvider = Provider<PhraseCardsRepository>.internal(
  phraseCardsRepository,
  name: r'phraseCardsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$phraseCardsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PhraseCardsRepositoryRef = ProviderRef<PhraseCardsRepository>;
String _$phraseCardsListStreamHash() =>
    r'f409653aa66191a00a4b4807a534da3b79f8b213';

/// See also [phraseCardsListStream].
@ProviderFor(phraseCardsListStream)
final phraseCardsListStreamProvider =
    AutoDisposeStreamProvider<List<PhraseCard>>.internal(
  phraseCardsListStream,
  name: r'phraseCardsListStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$phraseCardsListStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PhraseCardsListStreamRef
    = AutoDisposeStreamProviderRef<List<PhraseCard>>;
String _$phraseCardsListFutureHash() =>
    r'19d03b1d4f3818e7d24170efd9f9361ec56d01e1';

/// See also [phraseCardsListFuture].
@ProviderFor(phraseCardsListFuture)
final phraseCardsListFutureProvider =
    AutoDisposeFutureProvider<List<PhraseCard>>.internal(
  phraseCardsListFuture,
  name: r'phraseCardsListFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$phraseCardsListFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PhraseCardsListFutureRef
    = AutoDisposeFutureProviderRef<List<PhraseCard>>;
String _$phraseCardHash() => r'3c8a0395b4d729eaaf57a96e0b3adace8e06cb10';

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

/// See also [phraseCard].
@ProviderFor(phraseCard)
const phraseCardProvider = PhraseCardFamily();

/// See also [phraseCard].
class PhraseCardFamily extends Family<AsyncValue<PhraseCard?>> {
  /// See also [phraseCard].
  const PhraseCardFamily();

  /// See also [phraseCard].
  PhraseCardProvider call(
    String id,
  ) {
    return PhraseCardProvider(
      id,
    );
  }

  @override
  PhraseCardProvider getProviderOverride(
    covariant PhraseCardProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'phraseCardProvider';
}

/// See also [phraseCard].
class PhraseCardProvider extends AutoDisposeStreamProvider<PhraseCard?> {
  /// See also [phraseCard].
  PhraseCardProvider(
    String id,
  ) : this._internal(
          (ref) => phraseCard(
            ref as PhraseCardRef,
            id,
          ),
          from: phraseCardProvider,
          name: r'phraseCardProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$phraseCardHash,
          dependencies: PhraseCardFamily._dependencies,
          allTransitiveDependencies:
              PhraseCardFamily._allTransitiveDependencies,
          id: id,
        );

  PhraseCardProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    Stream<PhraseCard?> Function(PhraseCardRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PhraseCardProvider._internal(
        (ref) => create(ref as PhraseCardRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<PhraseCard?> createElement() {
    return _PhraseCardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PhraseCardProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PhraseCardRef on AutoDisposeStreamProviderRef<PhraseCard?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PhraseCardProviderElement
    extends AutoDisposeStreamProviderElement<PhraseCard?> with PhraseCardRef {
  _PhraseCardProviderElement(super.provider);

  @override
  String get id => (origin as PhraseCardProvider).id;
}

String _$phraseCardListSearchHash() =>
    r'3bb5e7300be4c25c96cc2b13899c6889ec850690';

/// See also [phraseCardListSearch].
@ProviderFor(phraseCardListSearch)
const phraseCardListSearchProvider = PhraseCardListSearchFamily();

/// See also [phraseCardListSearch].
class PhraseCardListSearchFamily extends Family<AsyncValue<List<PhraseCard>>> {
  /// See also [phraseCardListSearch].
  const PhraseCardListSearchFamily();

  /// See also [phraseCardListSearch].
  PhraseCardListSearchProvider call(
    String query,
  ) {
    return PhraseCardListSearchProvider(
      query,
    );
  }

  @override
  PhraseCardListSearchProvider getProviderOverride(
    covariant PhraseCardListSearchProvider provider,
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
  String? get name => r'phraseCardListSearchProvider';
}

/// See also [phraseCardListSearch].
class PhraseCardListSearchProvider
    extends AutoDisposeFutureProvider<List<PhraseCard>> {
  /// See also [phraseCardListSearch].
  PhraseCardListSearchProvider(
    String query,
  ) : this._internal(
          (ref) => phraseCardListSearch(
            ref as PhraseCardListSearchRef,
            query,
          ),
          from: phraseCardListSearchProvider,
          name: r'phraseCardListSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$phraseCardListSearchHash,
          dependencies: PhraseCardListSearchFamily._dependencies,
          allTransitiveDependencies:
              PhraseCardListSearchFamily._allTransitiveDependencies,
          query: query,
        );

  PhraseCardListSearchProvider._internal(
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
    FutureOr<List<PhraseCard>> Function(PhraseCardListSearchRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PhraseCardListSearchProvider._internal(
        (ref) => create(ref as PhraseCardListSearchRef),
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
  AutoDisposeFutureProviderElement<List<PhraseCard>> createElement() {
    return _PhraseCardListSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PhraseCardListSearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PhraseCardListSearchRef
    on AutoDisposeFutureProviderRef<List<PhraseCard>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _PhraseCardListSearchProviderElement
    extends AutoDisposeFutureProviderElement<List<PhraseCard>>
    with PhraseCardListSearchRef {
  _PhraseCardListSearchProviderElement(super.provider);

  @override
  String get query => (origin as PhraseCardListSearchProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
