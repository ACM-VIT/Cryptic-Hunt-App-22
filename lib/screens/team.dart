import 'package:cryptic_hunt/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/createTeamProvider.dart';
import '../Providers/joinTeamProvider.dart';
import '../widgets/textField.dart';
import 'navigation_manager.dart';

class TeamJoining extends StatelessWidget {
  static String id = "TeamJoining";

  const TeamJoining({Key? key}) : super(key: key);

  get createTeamProvider => null;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          ChangeNotifierProvider<CreateTeamProvider>(
            create: (context) => CreateTeamProvider(),
            child: Consumer<CreateTeamProvider>(
              builder: (context, team, _) => Text(
                  team.loading ? "Loading" : team.getTeamCode().toString()),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                CreateTeamProvider().getCreateTeamData();
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xffFF7A01),
              ),
              child: const Text(
                "Create",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              )),
          customTextFeild("Enter Team code", controller, TextInputType.name),
          ElevatedButton(
              onPressed: () {
                JoinTeamProvider().getJoinTeamData(controller.text.toString());
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xffFF7A01),
              ),
              child: const Text(
                "Join",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              )),
          ChangeNotifierProvider<JoinTeamProvider>(
            create: (context) => JoinTeamProvider(),
            child: Consumer<JoinTeamProvider>(
              builder: (context, team, _) => Text(
                  team.loading ? "Loading" : team.getTeamName().toString()),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, NavigationManager.id);
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xffFF7A01),
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              )),
        ],
      ),
    );
  }
}
