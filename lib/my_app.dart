import 'package:flutter/material.dart';
import 'pages/form_page.dart';
import 'themes_data/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().lightTheme(),
      darkTheme: ThemeData().darkTheme(),
      themeMode: ThemeMode.system,
      home: const FormPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
