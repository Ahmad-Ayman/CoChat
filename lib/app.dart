import 'package:cochat/core/shared/components/app_colors.dart';
import 'package:cochat/modules/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:flutter/material.dart';

import 'modules/auth/presentation/viewes/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CoChat',
      theme: ThemeData(
        primarySwatch: AppColors.mainColor1Material,
      ),
      routes: {
        '/': (context) => const OnBoardingScreen(),
        '/Login': (context) => LoginScreen(),
      },
      initialRoute: '/',
    );
  }
}
