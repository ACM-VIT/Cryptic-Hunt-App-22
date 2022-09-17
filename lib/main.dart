import 'providers/LoadingScreen/HomeScreenLoadingPercentage.dart';
import 'screens/hamburger.dart';
import 'screens/login.dart';
import 'screens/onBoarding.dart';
import 'screens/Loading.dart';
import 'screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Percentage(),
    child: const myApp(),
  ));
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Routes",
      initialRoute: Hamburger.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        Login.id: (context) => const Login(),
        OnBoarding.id: (context) => const OnBoarding(),
        Loading.id: (context) => const Loading(),
        Hamburger.id: (context) => const Hamburger(),
      },
    );
  }
}
