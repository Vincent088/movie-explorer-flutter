// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(movieDetailController)
final movieDetailControllerProvider = MovieDetailControllerFamily._();

final class MovieDetailControllerProvider
    extends
        $FunctionalProvider<
          AsyncValue<MovieDetail>,
          MovieDetail,
          FutureOr<MovieDetail>
        >
    with $FutureModifier<MovieDetail>, $FutureProvider<MovieDetail> {
  MovieDetailControllerProvider._({
    required MovieDetailControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'movieDetailControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$movieDetailControllerHash();

  @override
  String toString() {
    return r'movieDetailControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<MovieDetail> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MovieDetail> create(Ref ref) {
    final argument = this.argument as int;
    return movieDetailController(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieDetailControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieDetailControllerHash() =>
    r'6cc238caa4812089fcb88b10a489be24f3c09b5b';

final class MovieDetailControllerFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<MovieDetail>, int> {
  MovieDetailControllerFamily._()
    : super(
        retry: null,
        name: r'movieDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MovieDetailControllerProvider call(int movieId) =>
      MovieDetailControllerProvider._(argument: movieId, from: this);

  @override
  String toString() => r'movieDetailControllerProvider';
}
