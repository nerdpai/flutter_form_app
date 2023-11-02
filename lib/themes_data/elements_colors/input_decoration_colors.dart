import 'package:flutter/material.dart';

class InputDecorationColors {
  InputDecorationColors._({
    required this.disabledColor,
    required this.borderEnabledColor,
    required this.elementsEnabledColor,
    required this.focusColor,
    required this.errorColor,
  });

  InputDecorationColors.lightTheme()
      : this._(
          focusColor: Colors.blue[500]!,
          disabledColor: Colors.grey[300]!,
          errorColor: Colors.red[500]!,
          borderEnabledColor: Colors.grey[400]!,
          elementsEnabledColor: Colors.grey[600]!,
        );
  InputDecorationColors.darkTheme()
      : this._(
          focusColor: Colors.deepPurple[500]!,
          disabledColor: Colors.grey[800]!,
          errorColor: Colors.red[400]!,
          borderEnabledColor: Colors.grey[700]!,
          elementsEnabledColor: Colors.grey[500]!,
        );

  final Color disabledColor;
  final Color borderEnabledColor;
  final Color focusColor;
  final Color errorColor;
  final Color elementsEnabledColor;
}
