import 'package:cryptic_hunt/screens/leaderboard.dart';
import 'package:cryptic_hunt/widgets/countdowntimer.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: "Leaderboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Cryptic Hunt",
          ),
        ],
      ),
    );
  }
}
