// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flash_cards_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flashCardsRepositoryHash() =>
    r'6ca3694255b1c1e3f43be12b57d96f4ce633a605';

/// See also [flashCardsRepository].
@ProviderFor(flashCardsRepository)
final flashCardsRepositoryProvider = Provider<FlashCardsRepository>.internal(
  flashCardsRepository,
  name: r'flashCardsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flashCardsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlashCardsRepositoryRef = ProviderRef<FlashCardsRepository>;
String _$flashCardsListStreamHash() =>
    r'a582d0be9fd997c699e5c89dc50a144820ce835e';

/// See also [flashCardsListStream].
@ProviderFor(flashCardsListStream)
final flashCardsListStreamProvider =
    AutoDisposeStreamProvider<List<FlashCard>>.internal(
  flashCardsListStream,
  name: r'flashCardsListStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flashCardsListStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlashCardsListStreamRef = AutoDisposeStreamProviderRef<List<FlashCard>>;
String _$flashCardsListFutureHash() =>
    r'8bf7582efaa31ab5e44ca8d01b3bb893a653d1c9';

/// See also [flashCardsListFuture].
@ProviderFor(flashCardsListFuture)
final flashCardsListFutureProvider =
    AutoDisposeFutureProvider<List<FlashCard>>.internal(
  flashCardsListFuture,
  name: r'flashCardsListFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flashCardsListFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlashCardsListFutureRef = AutoDisposeFutureProviderRef<List<FlashCard>>;
String _$flashCardsStreamHash() => r'c4fb6de0a4e04df64997bb7dd95cc240c11ec4dd';

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

/// See also [flashCardsStream].
@ProviderFor(flashCardsStream)
const flashCardsStreamProvider = FlashCardsStreamFamily();

/// See also [flashCardsStream].
class FlashCardsStreamFamily extends Family<AsyncValue<FlashCard?>> {
  /// See also [flashCardsStream].
  const FlashCardsStreamFamily();

  /// See also [flashCardsStream].
  FlashCardsStreamProvider call(
    String id,
  ) {
    return FlashCardsStreamProvider(
      id,
    );
  }

  @override
  FlashCardsStreamProvider getProviderOverride(
    covariant FlashCardsStreamProvider provider,
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
  String? get name => r'flashCardsStreamProvider';
}

/// See also [flashCardsStream].
class FlashCardsStreamProvider extends AutoDisposeStreamProvider<FlashCard?> {
  /// See also [flashCardsStream].
  FlashCardsStreamProvider(
    String id,
  ) : this._internal(
          (ref) => flashCardsStream(
            ref as FlashCardsStreamRef,
            id,
          ),
          from: flashCardsStreamProvider,
          name: r'flashCardsStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$flashCardsStreamHash,
          dependencies: FlashCardsStreamFamily._dependencies,
          allTransitiveDependencies:
              FlashCardsStreamFamily._allTransitiveDependencies,
          id: id,
        );

  FlashCardsStreamProvider._internal(
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
    Stream<FlashCard?> Function(FlashCardsStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FlashCardsStreamProvider._internal(
        (ref) => create(ref as FlashCardsStreamRef),
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
  AutoDisposeStreamProviderElement<FlashCard?> createElement() {
    return _FlashCardsStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FlashCardsStreamProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FlashCardsStreamRef on AutoDisposeStreamProviderRef<FlashCard?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _FlashCardsStreamProviderElement
    extends AutoDisposeStreamProviderElement<FlashCard?>
    with FlashCardsStreamRef {
  _FlashCardsStreamProviderElement(super.provider);

  @override
  String get id => (origin as FlashCardsStreamProvider).id;
}

String _$flashCardFutureHash() => r'7a2bdfb5086ac4806df0eafd9618a6f75ede932d';

/// See also [flashCardFuture].
@ProviderFor(flashCardFuture)
const flashCardFutureProvider = FlashCardFutureFamily();

/// See also [flashCardFuture].
class FlashCardFutureFamily extends Family<AsyncValue<FlashCard?>> {
  /// See also [flashCardFuture].
  const FlashCardFutureFamily();

  /// See also [flashCardFuture].
  FlashCardFutureProvider call(
    String id,
  ) {
    return FlashCardFutureProvider(
      id,
    );
  }

  @override
  FlashCardFutureProvider getProviderOverride(
    covariant FlashCardFutureProvider provider,
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
  String? get name => r'flashCardFutureProvider';
}

/// See also [flashCardFuture].
class FlashCardFutureProvider extends AutoDisposeFutureProvider<FlashCard?> {
  /// See also [flashCardFuture].
  FlashCardFutureProvider(
    String id,
  ) : this._internal(
          (ref) => flashCardFuture(
            ref as FlashCardFutureRef,
            id,
          ),
          from: flashCardFutureProvider,
          name: r'flashCardFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$flashCardFutureHash,
          dependencies: FlashCardFutureFamily._dependencies,
          allTransitiveDependencies:
              FlashCardFutureFamily._allTransitiveDependencies,
          id: id,
        );

  FlashCardFutureProvider._internal(
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
    FutureOr<FlashCard?> Function(FlashCardFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FlashCardFutureProvider._internal(
        (ref) => create(ref as FlashCardFutureRef),
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
  AutoDisposeFutureProviderElement<FlashCard?> createElement() {
    return _FlashCardFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FlashCardFutureProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FlashCardFutureRef on AutoDisposeFutureProviderRef<FlashCard?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _FlashCardFutureProviderElement
    extends AutoDisposeFutureProviderElement<FlashCard?>
    with FlashCardFutureRef {
  _FlashCardFutureProviderElement(super.provider);

  @override
  String get id => (origin as FlashCardFutureProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
