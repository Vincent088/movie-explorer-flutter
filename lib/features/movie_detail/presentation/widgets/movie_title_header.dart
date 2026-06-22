import 'package:flutter/material.dart';

import '../../../movies/domain/model/movie.model.dart';
import 'favorite_toggle_button.dart';

class MovieTitleHeader extends StatelessWidget {
  final Movie movie;

  const MovieTitleHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            movie.title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
        FavoriteToggleButton(movie: movie),
      ],
    );
  }
}
