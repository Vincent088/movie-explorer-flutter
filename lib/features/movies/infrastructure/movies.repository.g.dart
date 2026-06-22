// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(moviesRepository)
final moviesRepositoryProvider = MoviesRepositoryProvider._();

final class MoviesRepositoryProvider
    extends
        $FunctionalProvider<
          MoviesRepository,
          MoviesRepository,
          MoviesRepository
        >
    with $Provider<MoviesRepository> {
  MoviesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'moviesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$moviesRepositoryHash();

  @$internal
  @override
  $ProviderElement<MoviesRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MoviesRepository create(Ref ref) {
    return moviesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MoviesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MoviesRepository>(value),
    );
  }
}

String _$moviesRepositoryHash() => r'3a91c0a99495a4e8537be0e4a989f9b3f25ab993';
