import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentMode = themeProvider.themeMode;

    return Scaffold(
      appBar: AppBar(title: Text('Настройки')),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: Text('Системная тема'),
            value: ThemeMode.system,
            groupValue: currentMode,
            onChanged: (mode) => themeProvider.setTheme(mode!),
          ),
          RadioListTile<ThemeMode>(
            title: Text('Светлая тема'),
            value: ThemeMode.light,
            groupValue: currentMode,
            onChanged: (mode) => themeProvider.setTheme(mode!),
          ),
          RadioListTile<ThemeMode>(
            title: Text('Тёмная тема'),
            value: ThemeMode.dark,
            groupValue: currentMode,
            onChanged: (mode) => themeProvider.setTheme(mode!),
          ),
        ],
      ),
    );
  }
}
