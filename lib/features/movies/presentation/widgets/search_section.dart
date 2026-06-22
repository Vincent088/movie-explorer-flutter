import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/search_bar_field.dart';
import '../controller/search.controller.dart';

class SearchSection extends ConsumerWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchControllerProvider.select((s) => s.query));

    return SearchBarField(value: query, onChanged: ref.read(searchControllerProvider.notifier).setQuery);
  }
}
