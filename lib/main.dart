import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:storyteller/constants/app_theme.dart';
import 'package:storyteller/screens/splash/splash_screen.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Storyteller',
      theme: appTheme,
      home: const SplashScreen(),
    );
  }
}
