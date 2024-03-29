import 'package:cryptic_hunt/Providers/home_page_notifier.dart';
import 'package:cryptic_hunt/Providers/team_notifier.dart';
import 'package:cryptic_hunt/screens/navigation_manager.dart';
import 'package:cryptic_hunt/widgets/custom_button.dart';
import 'package:cryptic_hunt/widgets/signup/textWidget.dart';
import 'package:cryptic_hunt/widgets/alerts/custom_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class JoinTeamScreen extends StatelessWidget {
  static String id = "JoinTeam";
  final fontFamily = "Poppins";
  final teamCodeController = TextEditingController();
  final bool validCode = false;
  JoinTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: SvgPicture.asset(
            "assets/join_team_bg.svg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: CustomTextWidget("Enter Team Code", fontFamily,
                    FontWeight.w600, 24, Theme.of(context).primaryColor)),
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: CustomTextWidget(
                    "Share the team code with your group members to let them join your team",
                    fontFamily,
                    FontWeight.w600,
                    24,
                    const Color(0xffFDFDFD))),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 30, 16, 8),
              child: TextField(
                style: const TextStyle(
                    letterSpacing: 4.0, color: Color(0xFFFF7A01)),
                textAlign: TextAlign.center,
                controller: teamCodeController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffff7a01), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  hintText: "Enter Team Code",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 30, 16, 60),
              child: Provider.of<TeamNotifier>(context, listen: false).busy
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () async {
                        final sc = ScaffoldMessenger.of(context);
                        if (teamCodeController.text.isNotEmpty) {
                          bool result = await Provider.of<TeamNotifier>(context,
                                  listen: false)
                              .joinTeam(teamCodeController.text);

                          if (result) {
                            // user successfully joined a team
                            Provider.of<HomePageNotifier>(context,
                                    listen: false)
                                .changeState(HomePageState.loggedIn);
                          }
                        } else {
                          sc.showSnackBar(const SnackBar(
                              content: Text('Enter a team code')));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          primary: const Color(0xffFF7A01),
                          minimumSize: const Size.fromHeight(40)),
                      child: const Text("JOIN TEAM",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ))),
            ),
          ],
        )
      ],
    );
  }
}
