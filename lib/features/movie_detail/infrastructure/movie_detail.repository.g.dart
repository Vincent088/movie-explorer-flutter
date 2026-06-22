// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(movieDetailRepository)
final movieDetailRepositoryProvider = MovieDetailRepositoryProvider._();

final class MovieDetailRepositoryProvider
    extends
        $FunctionalProvider<
          MovieDetailRepository,
          MovieDetailRepository,
          MovieDetailRepository
        >
    with $Provider<MovieDetailRepository> {
  MovieDetailRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'movieDetailRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$movieDetailRepositoryHash();

  @$internal
  @override
  $ProviderElement<MovieDetailRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MovieDetailRepository create(Ref ref) {
    return movieDetailRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MovieDetailRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MovieDetailRepository>(value),
    );
  }
}

String _$movieDetailRepositoryHash() =>
    r'b00ee79ac410231d7a612fab1c4734ec27a97eee';
