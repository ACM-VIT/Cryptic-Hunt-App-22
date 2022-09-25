import 'dart:ui';

import 'package:cryptic_hunt/Providers/home_page_notifier.dart';
import 'package:cryptic_hunt/Providers/phase_notifier.dart';
import 'package:cryptic_hunt/Providers/question_group_list_notifier.dart';
import 'package:cryptic_hunt/Providers/team_notifier.dart';
import 'package:cryptic_hunt/Providers/leaderboard_page_notifier.dart';
import 'package:cryptic_hunt/data/leaderboard.dart';
import 'package:cryptic_hunt/screens/google_sign_in_page.dart';
import 'package:cryptic_hunt/screens/navigation_manager.dart';
import 'package:cryptic_hunt/screens/onBoarding.dart';
import 'package:cryptic_hunt/screens/team_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

// class HomePage extends StatelessWidget {
//   static String id = 'HomePage';
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const LoadingScreen();
//         } else if (snapshot.hasData) {
//           print("----------DATA------------");
//           print(snapshot.data);
//           return const NavigationManager();
//         } else if (snapshot.hasError) {
//           return const Center(child: Text('Something went wrong!'));
//         } else {
//           return const OnBoarding();
//         }
//       },
//     );
//   }
// }

class HomePage extends StatelessWidget {
  static String id = 'HomePage';

  HomePage({Key? key, required this.notifier}) : super(key: key);
  HomePageNotifier notifier;

  @override
  Widget build(BuildContext context) {
    if (notifier.state == HomePageState.onBoardingScreen) {
      return OnBoarding();
    } else if (notifier.state == HomePageState.loggedOut) {
      return GoogleSignInPage();
    } else if (notifier.state == HomePageState.notInTeam) {
      return ChangeNotifierProvider(
        create: (_) => TeamNotifier(),
        builder: (context, child) {
          return TeamPage(notifier: Provider.of<TeamNotifier>(context));
        },
      );
    } else {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<LeaderBoardPageNotifier>(
            create: (context) => LeaderBoardPageNotifier(),
          ),
          ChangeNotifierProvider<PhaseNotifier>(
            create: (context) => PhaseNotifier(),
          ),
          ChangeNotifierProvider<QuestionGroupListNotifier>(
            create: (context) => QuestionGroupListNotifier(),
          ),
        ],
        child: NavigationManager(),
        builder: ((context, child) => child!),
      );
      // ChangeNotifierProvider<LeaderBoardPageNotifier>(
      //   create: (context) => LeaderBoardPageNotifier(),
      //   builder: (context, child) => child!,
      //   child: NavigationManager(),
      // );
    }
  }
}
