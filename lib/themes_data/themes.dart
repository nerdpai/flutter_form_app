import 'package:flutter/material.dart';
import 'package:flutter_application_hw/themes_data/elements_themes_extensions/text_selection_theme.dart';
import 'theme_colors.dart';
import 'elements_themes_extensions/input_decoration_theme.dart';

extension Themes on ThemeData {
  static ThemeData _getThemeFrom({
    required Brightness brightness,
    required ThemeColors colors,
    required ColorScheme colorScheme,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      inputDecorationTheme: const InputDecorationTheme().getFrom(
        colors: colors.inputDecorationColors,
      ),
      textSelectionTheme: const TextSelectionThemeData().getFrom(
        colors: colors.textSelectionColors,
      ),
      colorScheme: colorScheme,
    );
  }

  ThemeData lightTheme() {
    return _getThemeFrom(
      brightness: Brightness.light,
      colors: ThemeColors.lightTheme(),
      colorScheme: const ColorScheme.light().copyWith(
        primary: Colors.blue,
      ),
    );
  }

  ThemeData darkTheme() {
    return _getThemeFrom(
        brightness: Brightness.dark,
        colors: ThemeColors.darkTheme(),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.deepPurpleAccent[100],
        ));
  }
}
