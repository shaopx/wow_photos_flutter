// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$imageCacheHash() => r'7dbb9209cfb126160b2e2860674174e6ad70cbef';

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

/// See also [imageCache].
@ProviderFor(imageCache)
const imageCacheProvider = ImageCacheFamily();

/// See also [imageCache].
class ImageCacheFamily extends Family<AsyncValue<File?>> {
  /// See also [imageCache].
  const ImageCacheFamily();

  /// See also [imageCache].
  ImageCacheProvider call(
    String imageUrl,
  ) {
    return ImageCacheProvider(
      imageUrl,
    );
  }

  @override
  ImageCacheProvider getProviderOverride(
    covariant ImageCacheProvider provider,
  ) {
    return call(
      provider.imageUrl,
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
  String? get name => r'imageCacheProvider';
}

/// See also [imageCache].
class ImageCacheProvider extends AutoDisposeFutureProvider<File?> {
  /// See also [imageCache].
  ImageCacheProvider(
    String imageUrl,
  ) : this._internal(
          (ref) => imageCache(
            ref as ImageCacheRef,
            imageUrl,
          ),
          from: imageCacheProvider,
          name: r'imageCacheProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$imageCacheHash,
          dependencies: ImageCacheFamily._dependencies,
          allTransitiveDependencies:
              ImageCacheFamily._allTransitiveDependencies,
          imageUrl: imageUrl,
        );

  ImageCacheProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.imageUrl,
  }) : super.internal();

  final String imageUrl;

  @override
  Override overrideWith(
    FutureOr<File?> Function(ImageCacheRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ImageCacheProvider._internal(
        (ref) => create(ref as ImageCacheRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        imageUrl: imageUrl,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<File?> createElement() {
    return _ImageCacheProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ImageCacheProvider && other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, imageUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ImageCacheRef on AutoDisposeFutureProviderRef<File?> {
  /// The parameter `imageUrl` of this provider.
  String get imageUrl;
}

class _ImageCacheProviderElement extends AutoDisposeFutureProviderElement<File?>
    with ImageCacheRef {
  _ImageCacheProviderElement(super.provider);

  @override
  String get imageUrl => (origin as ImageCacheProvider).imageUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
