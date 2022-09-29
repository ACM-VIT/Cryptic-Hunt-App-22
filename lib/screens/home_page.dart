import 'dart:ui';

import 'package:cryptic_hunt/Providers/home_page_notifier.dart';
import 'package:cryptic_hunt/Providers/phase_notifier.dart';
import 'package:cryptic_hunt/Providers/question_group_list_notifier.dart';
import 'package:cryptic_hunt/Providers/team_notifier.dart';
import 'package:cryptic_hunt/Providers/leaderboard_page_notifier.dart';
import 'package:cryptic_hunt/data/leaderboard.dart';
import 'package:cryptic_hunt/networking/networkExceptions.dart';
import 'package:cryptic_hunt/screens/google_sign_in_page.dart';
import 'package:cryptic_hunt/screens/navigation_manager.dart';
import 'package:cryptic_hunt/screens/onBoarding.dart';
import 'package:cryptic_hunt/screens/team_page.dart';
import 'package:cryptic_hunt/widgets/alerts/custom_alert_dialog.dart';
import 'package:cryptic_hunt/widgets/progressIndicator.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../networking/util.dart';

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

class HomePage extends StatefulWidget {
  static String id = 'HomePage';

  HomePage({Key? key, required this.notifier}) : super(key: key);
  HomePageNotifier notifier;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    GetIt.I<MyDio>().stream.listen((event) {
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     if(event is BadRequestException){
      //       return CustomAlertDialog(title: "Error", buttonText: "cancel", onPressed: onPressed)
      //     }
      //   }
      // );
      if (event is WhiteListException) {
        showDialog(
            context: context,
            builder: (context) {
              return CustomAlertDialog(
                title: "Please check in",
                message: "Restart your app after check in",
                buttonText: "OK",
                onPressed: () {
                  onLinkLaunch();
                },
              );
            });
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(event.userMsg),
      ));
    });
    super.initState();
  }

  void onLinkLaunch() async {
    String link = "https://cryptichunt.acmvit.in";
    if (await canLaunchUrl(Uri.parse(link))) {
      await launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.notifier.busy)
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OwlProgressIndicator(),
          ),
        ),
      );
    if (widget.notifier.state == HomePageState.onBoardingScreen) {
      return OnBoarding();
    } else if (widget.notifier.state == HomePageState.loggedOut) {
      return GoogleSignInPage();
    } else if (widget.notifier.state == HomePageState.notInTeam) {
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
