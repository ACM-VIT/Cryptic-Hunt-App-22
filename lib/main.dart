import 'package:cryptic_hunt/Providers/home_page_notifier.dart';

import 'package:cryptic_hunt/locator.dart';

import 'package:cryptic_hunt/screens/home_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:cryptic_hunt/screens/hamburger.dart';
import 'package:cryptic_hunt/screens/join_team.dart';

import 'package:cryptic_hunt/screens/create_team.dart';
import 'package:cryptic_hunt/screens/faq_screen.dart';
import 'providers/LoadingScreen/HomeScreenLoadingPercentage.dart';
import 'screens/hamburger.dart';
import 'screens/login.dart';
import 'screens/navigation_manager.dart';
import 'screens/onBoarding.dart';
import 'screens/Loading.dart';
import 'package:cryptic_hunt/screens/speakerScreen.dart';
import 'package:cryptic_hunt/screens/signUp.dart';
import 'package:cryptic_hunt/widgets/countdown_timer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cryptic_hunt/screens/timeline.dart';
import 'package:cryptic_hunt/screens/createTeam.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cryptic_hunt/screens/loading_screen.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print(
      "Handling a background message: ${message.messageId} !! ${message.notification?.title}");
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  setup();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Percentage>(create: (_) => Percentage()),
      ],
      child: const myApp(),
    ),
  );
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: const Color(0xffC7C7C7),
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(Color(0XFFFF8618)),
          trackColor: MaterialStateProperty.all(Colors.black),
        ),
        scaffoldBackgroundColor: Color(0xFFFFF4EA),
        primaryColor: Color(0XFFFF8618),
        textTheme: TextTheme(
            headline1: GoogleFonts.poppins().copyWith(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
            subtitle1: GoogleFonts.poppins().copyWith(
                color: Color(0XFF777777),
                fontSize: 14,
                fontWeight: FontWeight.w400)),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffff7a01), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7))),
        ),
      ),
      title: "Routes",
      initialRoute: HomePage.id,
      routes: {
        JoinTeam.id: (context) => const JoinTeam(),

        HomePage.id: (context) => ChangeNotifierProvider(
              create: (context) => HomePageNotifier(),
              child: Consumer<HomePageNotifier>(
                  builder: (context, value, child) =>
                      HomePage(notifier: value)),
            ),
        LoadingScreen.id: (context) => const LoadingScreen(),
        NavigationManager.id: (context) => const NavigationManager(),
        SignUp.id: (context) => SignUp(),
        // SplashScreen.id: (context) => const SplashScreen(),
        Login.id: (context) => const Login(),
        OnBoarding.id: (context) => const OnBoarding(),
        Loading.id: (context) => const Loading(),

        Hamburger.id: (context) => const Hamburger(),
        // QuestionPage.id: (context) => QuestionPage(),

        // Hamburger.id: (context) => const Hamburger(),
        CountDownTimer.id: (context) => const CountDownTimer(),
        SpeakerScreen.id: (context) => const SpeakerScreen(),
        Timeline.id: (context) => const Timeline(),
        CreateTeamFirst.id: (context) => CreateTeamFirst(),
        CreateTeam.id: (context) => const CreateTeamPage(),
        FaqScreen.id: (context) => const FaqScreen(),
      },
    );
  }
}
