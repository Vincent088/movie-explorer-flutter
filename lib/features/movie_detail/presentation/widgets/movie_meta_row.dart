import 'package:flutter/material.dart';

import '../../../../core/configs/app_theme.dart';

class MovieMetaRow extends StatelessWidget {
  final double voteAverage;
  final String releaseDate;
  final int runtime;

  const MovieMetaRow({super.key, required this.voteAverage, required this.releaseDate, required this.runtime});

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Row(
      children: [
        Text(
          '⭐ ${voteAverage.toStringAsFixed(1)}',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: onSurface),
        ),
        const SizedBox(width: 14),
        Text(releaseDate, style: TextStyle(fontSize: 13, color: context.mutedText)),
        if (runtime > 0) ...[const SizedBox(width: 14), Text('$runtime min', style: TextStyle(fontSize: 13, color: context.mutedText))],
      ],
    );
  }
}
