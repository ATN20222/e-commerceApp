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

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: EdgeInsets.only(top: 40),
      children: [
        buildSettingOption(
          Icons.support,
          'Support',
          () {
            // Functionality for Support option
            // Add your code here
          },
        ),
        buildSettingOption(
          Icons.info,
          'About',
          () {
            // Functionality for About option
            // Add your code here
          },
        ),
        buildSettingOption(
          Icons.dark_mode,
          'Dark Mode',
          () {
            // Toggle dark mode
          },
          switchWidget: Switch(
            value: ref.watch(isDarkModeProvider),
            onChanged: (newMode) {
              ref.read(isDarkModeProvider.notifier).toggleDarkMode(newMode);
            },
          ),
        ),
        buildSettingOption(
          Icons.language,
          'Languages',
          () {
            // Functionality for Languages option
            // Add your code here
          },
        ),
        buildSettingOption(
          Icons.logout,
          'Log out',
          () {
            // Functionality for Log out option
            // Add your code here
          },
          isLogout: true,
        ),
      ],
    );
  }

  Widget buildSettingOption(
    IconData icon,
    String title,
    VoidCallback onPressed, {
    bool isLogout = false,
    Widget? switchWidget,
  }) {
    return ListTile(
      onTap:
          onPressed, // Assign the provided onPressed callback to the ListTile's onTap
      leading: Icon(
        icon,
        color: isLogout ? Colors.red : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red : null,
        ),
      ),
      trailing: switchWidget ?? Icon(Icons.arrow_forward_ios),
    );
  }
}
