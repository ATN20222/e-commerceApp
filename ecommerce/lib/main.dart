import 'package:ecommerce/screens/main_screen.dart';
import 'package:ecommerce/screens/setting_screen.dart';
import 'package:ecommerce/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants/theme.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ref.watch(isDarkModeProvider)
          ? ThemeManager.shared.getDarkTheme()
          : ThemeManager.shared.getLightTheme(),
      home: MainScreen(),
    );
  }
}
