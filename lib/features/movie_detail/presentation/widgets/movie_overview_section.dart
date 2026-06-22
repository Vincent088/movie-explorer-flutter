import 'package:flutter/material.dart';

import '../../../../core/configs/app_theme.dart';
import '../../../../core/constants/strings.constants.dart';

class MovieOverviewSection extends StatelessWidget {
  final String overview;

  const MovieOverviewSection({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.detail.overview,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(height: 8),
        Text(overview, style: TextStyle(fontSize: 15, height: 1.6, color: context.mutedText)),
      ],
    );
  }
}
