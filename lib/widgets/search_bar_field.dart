import 'package:flutter/material.dart';

import '../core/constants/strings.constants.dart';

class SearchBarField extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const SearchBarField({super.key, required this.value, required this.onChanged});

  @override
  State<SearchBarField> createState() => _SearchBarFieldState();
}

class _SearchBarFieldState extends State<SearchBarField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(SearchBarField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleClear() {
    _controller.clear();
    widget.onChanged('');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? const Color(0xFF777777) : const Color(0xFF999999);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        textInputAction: TextInputAction.search,
        style: TextStyle(color: isDark ? Colors.white : Colors.black, fontSize: 16),
        decoration: InputDecoration(
          hintText: Strings.home.searchPlaceholder,
          hintStyle: TextStyle(color: iconColor),
          filled: true,
          fillColor: isDark ? const Color(0xFF222222) : const Color(0xFFE8E8E8),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
          prefixIcon: Icon(Icons.search, color: iconColor),
          suffixIcon: ValueListenableBuilder<TextEditingValue>(
            valueListenable: _controller,
            builder: (context, value, _) {
              if (value.text.isEmpty) return const SizedBox.shrink();
              return IconButton(
                icon: Icon(Icons.close, color: iconColor),
                onPressed: _handleClear,
              );
            },
          ),
        ),
      ),
    );
  }
}
