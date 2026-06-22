import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/configs/app_theme.dart';
import '../../../favorites/presentation/controller/favorites.controller.dart';
import '../../../movies/domain/model/movie.model.dart';

class FavoriteToggleButton extends ConsumerWidget {
  final Movie movie;

  const FavoriteToggleButton({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFav = ref.watch(favoritesControllerProvider.select((favorites) => favorites.any((m) => m.id == movie.id)));

    return IconButton(
      onPressed: () {
        final notifier = ref.read(favoritesControllerProvider.notifier);
        if (isFav) {
          notifier.removeFavorite(movie.id);
        } else {
          notifier.addFavorite(movie);
        }
      },
      icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: isFav ? const Color(0xFFE50914) : context.mutedText, size: 26),
    );
  }
}
