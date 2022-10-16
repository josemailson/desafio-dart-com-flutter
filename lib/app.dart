import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'features/authentication/login_page.dart';
import 'features/authentication/splash.dart';
import 'features/design_system/my_color.dart';
import 'features/design_system/text_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: const SplashPage(),
      routes: {
        'splash': (context) => const SplashPage(),
        'login': (context) => const LoginPage(),
      },
    );
  }
}
