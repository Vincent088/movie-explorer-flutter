// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoritesController)
final favoritesControllerProvider = FavoritesControllerProvider._();

final class FavoritesControllerProvider
    extends $NotifierProvider<FavoritesController, List<Movie>> {
  FavoritesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesControllerHash();

  @$internal
  @override
  FavoritesController create() => FavoritesController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Movie> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Movie>>(value),
    );
  }
}

String _$favoritesControllerHash() =>
    r'c25e73e96fb5adf3a408ec3064d7f2a937a71f9c';

abstract class _$FavoritesController extends $Notifier<List<Movie>> {
  List<Movie> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Movie>, List<Movie>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Movie>, List<Movie>>,
              List<Movie>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
