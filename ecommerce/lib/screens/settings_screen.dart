import 'package:ecommerce/dataprovider/remote/firebasehelper.dart';
import 'package:ecommerce/screens/login_screen.dart';
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
          icon: Icons.support,
          title: 'Support',
          onPressed: () {
            // Functionality for Support option
            // Add your code here
          },
        ),
        buildSettingOption(
          icon: Icons.info,
          title: 'About',
          onPressed: () {
            // Functionality for About option
            // Add your code here
          },
        ),
        buildSettingOption(
          icon: Icons.dark_mode,
          title: 'Dark Mode',
          onPressed: () {
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
          icon: Icons.language,
          title: 'Languages',
          onPressed: () {
            // Functionality for Languages option
            // Add your code here
          },
        ),
        buildSettingOption(
          icon: Icons.logout,
          title: 'Log out',
          onPressed: () async {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()));
            await FireBaseHelper().signOut();
          },
        ),
      ],
    );
  }

  Widget buildSettingOption({
    required VoidCallback onPressed,
    required IconData icon,
    required String title,
    Widget? switchWidget,
  }) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      trailing: switchWidget ?? Icon(Icons.arrow_forward_ios),
    );
  }
}
