import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/strings.constants.dart';
import '../../../widgets/error_message.dart';
import '../../../widgets/loading_indicator.dart';
import 'controller/movies.controller.dart';
import 'widgets/home_movie_grid.dart';
import 'widgets/search_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesState = ref.watch(moviesControllerProvider);
    final isInitialLoad = moviesState.movies.isEmpty;

    if (isInitialLoad && moviesState.loading) {
      return const Scaffold(body: LoadingIndicator());
    }

    if (isInitialLoad && moviesState.error != null) {
      return Scaffold(
        body: ErrorMessage(message: moviesState.error!, onRetry: ref.read(moviesControllerProvider.notifier).refresh),
      );
    }

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                Strings.home.title,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            const SearchSection(),
            const Expanded(child: HomeMovieGrid()),
          ],
        ),
      ),
    );
  }
}
