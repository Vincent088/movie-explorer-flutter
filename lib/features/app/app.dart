import 'package:flutter/material.dart';

import '../../core/configs/app_theme.dart';
import '../movies/presentation/home.screen.dart';

class MovieExplorerApp extends StatelessWidget {
  const MovieExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Movie Explorer', debugShowCheckedModeBanner: false, theme: AppTheme.light, darkTheme: AppTheme.dark, themeMode: ThemeMode.system, home: const HomeScreen());
  }
}
