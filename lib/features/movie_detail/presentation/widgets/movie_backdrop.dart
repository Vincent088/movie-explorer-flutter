import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/configs/app_theme.dart';
import '../../../../core/constants/api.constants.dart';

class MovieBackdrop extends StatelessWidget {
  final String? backdropPath;

  const MovieBackdrop({super.key, required this.backdropPath});

  @override
  Widget build(BuildContext context) {
    final backdropUrl = backdropPath != null ? '${Api.imageUrl}$backdropPath' : null;

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: backdropUrl != null ? CachedNetworkImage(imageUrl: backdropUrl, fit: BoxFit.cover) : Container(color: context.surfaceAlt),
    );
  }
}
