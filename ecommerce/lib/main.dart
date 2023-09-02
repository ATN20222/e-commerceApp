import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/main_screen.dart';
import 'package:ecommerce/screens/settings_screen.dart';
import 'package:ecommerce/screens/signup_screen.dart';
import 'package:ecommerce/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
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
      // home: MainScreen(),
      home: LoginScreen(),
    );
  }
}
