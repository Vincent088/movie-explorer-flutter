// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MoviesController)
final moviesControllerProvider = MoviesControllerProvider._();

final class MoviesControllerProvider
    extends $NotifierProvider<MoviesController, MoviesState> {
  MoviesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'moviesControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$moviesControllerHash();

  @$internal
  @override
  MoviesController create() => MoviesController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MoviesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MoviesState>(value),
    );
  }
}

String _$moviesControllerHash() => r'3bfbf0faa711681b952d87e6c6db600d0655eb7f';

abstract class _$MoviesController extends $Notifier<MoviesState> {
  MoviesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MoviesState, MoviesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MoviesState, MoviesState>,
              MoviesState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
