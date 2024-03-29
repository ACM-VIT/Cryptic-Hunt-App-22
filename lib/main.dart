import 'package:cryptic_hunt/Providers/home_page_notifier.dart';

import 'package:cryptic_hunt/locator.dart';

import 'package:cryptic_hunt/screens/home_page.dart';
import 'package:cryptic_hunt/screens/team_menu_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:cryptic_hunt/screens/join_team.dart';

import 'package:cryptic_hunt/screens/faq_screen.dart';

import 'screens/google_sign_in_page.dart';
import 'screens/navigation_manager.dart';
import 'screens/onBoarding.dart';
import 'package:cryptic_hunt/screens/signUp.dart';
import 'package:cryptic_hunt/widgets/countdown_timer.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  setup();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFFFFF4EA),
      statusBarColor: Color(0xFFFFF4EA),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(
    const myApp(),
  );
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: const Color(0xffC7C7C7),
      theme: ThemeData(
        snackBarTheme: SnackBarThemeData(
            behavior: SnackBarBehavior.floating, backgroundColor: Colors.red),
        scrollbarTheme: ScrollbarThemeData(
          radius: const Radius.circular(100),
          thickness: MaterialStateProperty.all(7),
          thumbVisibility: MaterialStateProperty.all(true),
          trackVisibility: MaterialStateProperty.all(true),
          thumbColor: MaterialStateProperty.all(const Color(0XFFFF8618)),
          trackColor: MaterialStateProperty.all(Colors.black),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0XFFFF8618)),
        scaffoldBackgroundColor: const Color(0xFFFFF4EA),
        primaryColor: const Color(0XFFFF8618),
        textTheme: TextTheme(
            headline1: GoogleFonts.poppins().copyWith(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
            headline2: GoogleFonts.notoSans().copyWith(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
            subtitle1: GoogleFonts.poppins().copyWith(
                color: const Color(0XFF777777),
                fontSize: 14,
                fontWeight: FontWeight.w400),
            subtitle2: GoogleFonts.notoSans().copyWith(
                color: const Color(0XFF777777),
                fontSize: 16,
                fontWeight: FontWeight.w500)),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffff7a01), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7))),
        ),
      ),
      title: "Routes",
      initialRoute: HomePage.id,
      routes: {
        TeamMenuPage.id: (context) => const Scaffold(body: TeamMenuPage()),
        JoinTeamScreen.id: (context) => JoinTeamScreen(),

        HomePage.id: (context) => ChangeNotifierProvider(
              create: (context) => HomePageNotifier(),
              child: Consumer<HomePageNotifier>(
                  builder: (context, value, child) =>
                      HomePage(notifier: value)),
            ),

        NavigationManager.id: (context) => const NavigationManager(),
        SignUp.id: (context) => SignUp(),
        // SplashScreen.id: (context) => const SplashScreen(),
        GoogleSignInPage.id: (context) => const GoogleSignInPage(),
        OnBoarding.id: (context) => OnBoarding(),

        NavigationManager.id: (context) => const NavigationManager(),
        // QuestionPage.id: (context) => QuestionPage(),

        // Hamburger.id: (context) => const Hamburger(),
        CountDownTimer.id: (context) => const CountDownTimer(),

        FaqScreen.id: (context) => FaqScreen(),
      },
    );
  }
}
