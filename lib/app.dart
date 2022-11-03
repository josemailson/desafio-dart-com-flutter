import 'package:flutter/material.dart';
import 'features/authentication/login_page.dart';
import 'features/authentication/splash.dart';
import 'features/design_system/my_color.dart';
import 'home/home.dart';
import 'registration/registration_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: MyColor.black, secondary: MyColor.black)),
      home: const SplashPage(),
    );
  }
}
