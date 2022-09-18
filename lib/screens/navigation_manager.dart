import 'leaderboard.dart';
import '/widgets/countdowntimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationManager extends StatefulWidget {
  const NavigationManager({super.key});

  static String id = "NavigationManager";

  @override
  State<NavigationManager> createState() => _NavigationManagerState();
}

class _NavigationManagerState extends State<NavigationManager> {
  int currentIndex = 0;
  final pages = [const Leaderboard(), const CountDownTimer()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.blue,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/navbar/leaderboard_icon.svg',
              ),
              label: "Leaderboard",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/navbar/cryptic_hunt_icon.svg',
              ),
              label: "The Hunt",
            ),
          ]),
    );
  }
}
