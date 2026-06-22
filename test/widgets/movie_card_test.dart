import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_explorer_flutter/features/movies/domain/model/movie.model.dart';
import 'package:movie_explorer_flutter/widgets/movie_card.dart';

void main() {
  final mockMovie = Movie(
    id: 1,
    title: 'The Dark Knight',
    overview: 'A great movie about a bat man.',
    posterPath: null,
    backdropPath: '/backdrop.jpg',
    releaseDate: '2008-07-18',
    voteAverage: 9.0,
    genreIds: const [28, 80],
  );

  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  testWidgets('renders the movie title', (tester) async {
    await tester.pumpWidget(wrap(MovieCard(movie: mockMovie, onPress: () {})));
    expect(find.text('The Dark Knight'), findsOneWidget);
  });

  testWidgets('renders the release year', (tester) async {
    await tester.pumpWidget(wrap(MovieCard(movie: mockMovie, onPress: () {})));
    expect(find.text('2008'), findsOneWidget);
  });

  testWidgets('renders the rating', (tester) async {
    await tester.pumpWidget(wrap(MovieCard(movie: mockMovie, onPress: () {})));
    expect(find.text('★ 9.0'), findsOneWidget);
  });

  testWidgets('calls onPress when tapped', (tester) async {
    var pressed = false;
    await tester.pumpWidget(wrap(MovieCard(movie: mockMovie, onPress: () => pressed = true)));
    await tester.tap(find.text('The Dark Knight'));
    expect(pressed, isTrue);
  });

  testWidgets('does not crash when poster_path is null', (tester) async {
    await tester.pumpWidget(wrap(MovieCard(movie: mockMovie, onPress: () {})));
    expect(find.text('The Dark Knight'), findsOneWidget);
  });
}
