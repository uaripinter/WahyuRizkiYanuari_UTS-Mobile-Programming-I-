import 'package:flutter/material.dart';
import 'screens/home_page.dart';

// App-wide color palette
class AppColors {
  static const forest = Color(0xFF1F3D3A);
  static const sage = Color(0xFF8FA998);
  static const rose = Color(0xFFD9A5A0);
  static const mustard = Color(0xFFE0B04F);
  static const clay = Color(0xFFB5654A);
  static const ivory = Color(0xFFF5F0E6);
}

void main() => runApp(const DaunRumahApp());

class DaunRumahApp extends StatelessWidget {
  const DaunRumahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daun Rumah',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.ivory,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.forest),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.forest,
          foregroundColor: AppColors.ivory,
        ),
      ),
      home: const HomePage(),
    );
  }
}
