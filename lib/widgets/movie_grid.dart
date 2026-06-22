import 'package:flutter/material.dart';

import '../core/constants/strings.constants.dart';
import '../features/movies/domain/model/movie.model.dart';
import '../core/configs/app_theme.dart';
import 'error_message.dart';
import 'loading_indicator.dart';
import 'movie_card.dart';

int getNumColumns(double width) {
  if (width >= 1200) return 6;
  if (width >= 900) return 5;
  if (width >= 600) return 4;
  if (width >= 480) return 3;
  return 2;
}

class MovieGrid extends StatefulWidget {
  final List<Movie> movies;
  final bool loading;
  final bool hasMore;
  final VoidCallback onLoadMore;
  final ValueChanged<Movie> onMoviePress;
  final String? error;
  final VoidCallback? onRetry;

  const MovieGrid({super.key, required this.movies, required this.loading, required this.hasMore, required this.onLoadMore, required this.onMoviePress, this.error, this.onRetry});

  @override
  State<MovieGrid> createState() => _MovieGridState();
}

class _MovieGridState extends State<MovieGrid> {
  final ScrollController _controller = ScrollController();
  bool _showScrollTop = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleScroll);
    _controller.dispose();
    super.dispose();
  }

  void _handleScroll() {
    final showScrollTop = _controller.offset > 300;
    if (showScrollTop != _showScrollTop) {
      setState(() => _showScrollTop = showScrollTop);
    }

    if (widget.hasMore && !widget.loading && _controller.position.extentAfter < 400) {
      widget.onLoadMore();
    }
  }

  void _scrollToTop() {
    _controller.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) {
      if (widget.loading) return const LoadingIndicator();
      if (widget.error != null) {
        return ErrorMessage(message: widget.error!, onRetry: widget.onRetry);
      }
      return Center(
        child: Text(Strings.home.noResults, style: TextStyle(fontSize: 16, color: context.mutedText)),
      );
    }

    final width = MediaQuery.sizeOf(context).width;
    final numColumns = getNumColumns(width);

    return Stack(
      children: [
        CustomScrollView(
          controller: _controller,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: numColumns, childAspectRatio: 2 / 3.6),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final movie = widget.movies[index];
                  return MovieCard(movie: movie, onPress: () => widget.onMoviePress(movie));
                }, childCount: widget.movies.length),
              ),
            ),
            if (widget.loading)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: LoadingIndicator()),
                ),
              ),
          ],
        ),
        if (_showScrollTop)
          Positioned(
            bottom: 24,
            right: 20,
            child: FloatingActionButton(
              mini: false,
              backgroundColor: const Color(0xFFE50914),
              onPressed: _scrollToTop,
              child: const Icon(Icons.keyboard_arrow_up, color: Colors.white),
            ),
          ),
      ],
    );
  }
}
