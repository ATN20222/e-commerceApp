import 'package:ecommerce/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final isDarkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>((ref) {
  return DarkModeNotifier();
});

class DarkModeNotifier extends StateNotifier<bool> {
  DarkModeNotifier() : super(false) {
    _loadIsDarkMode();
  }

  Future<void> _loadIsDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = prefs.getBool('isDarkMode') ?? false;
  }

  void toggleDarkMode(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', newValue);
    state = newValue;
  }
}

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Switch Mode",
          style: TextStyle(
            color: AppColors.orange,
          ),
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) =>
              Expanded(
            child: SwitchListTile(
              value: ref.watch(isDarkModeProvider),
              onChanged: (newMode) {
                ref.read(isDarkModeProvider.notifier).toggleDarkMode(newMode);
              },
              title: const Text(
                "Toggle Theme ",
                style: TextStyle(
                  color: AppColors.orange,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
