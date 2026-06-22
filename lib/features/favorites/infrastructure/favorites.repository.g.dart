// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(favoritesRepository)
final favoritesRepositoryProvider = FavoritesRepositoryProvider._();

final class FavoritesRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<FavoritesRepository>,
          FavoritesRepository,
          FutureOr<FavoritesRepository>
        >
    with
        $FutureModifier<FavoritesRepository>,
        $FutureProvider<FavoritesRepository> {
  FavoritesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<FavoritesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FavoritesRepository> create(Ref ref) {
    return favoritesRepository(ref);
  }
}

String _$favoritesRepositoryHash() =>
    r'249bc719126dd24881b750383482e215efb6791d';
