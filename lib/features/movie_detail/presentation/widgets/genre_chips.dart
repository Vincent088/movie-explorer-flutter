import 'package:flutter/material.dart';

import '../../domain/model/genre.model.dart';

class GenreChips extends StatelessWidget {
  final List<Genre> genres;

  const GenreChips({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    if (genres.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Wrap(spacing: 8, runSpacing: 8, children: genres.map((genre) => _GenreChip(name: genre.name)).toList()),
    );
  }
}

class _GenreChip extends StatelessWidget {
  final String name;

  const _GenreChip({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(color: const Color(0xFFE50914), borderRadius: BorderRadius.circular(20)),
      child: Text(
        name,
        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
