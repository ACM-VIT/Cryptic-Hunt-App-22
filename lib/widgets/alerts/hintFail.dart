import 'package:cryptic_hunt/widgets/alerts/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HintFailAlert extends StatelessWidget {
  const HintFailAlert({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    // return AlertDialog(
    //   title: const Text('Hint'),
    //   content: SingleChildScrollView(
    //     child: ListBody(
    //       children: <Widget>[
    //         Text(hintText),
    //       ],
    //     ),
    //   ),
    //   actions: <Widget>[
    //     TextButton(
    //       child: Text('back'),
    //       onPressed: onPressed,
    //     ),
    //   ],
    // );

    return CustomAlertDialog(
        title: "Less Points",
        message: "You do not have enough points to get hint",
        buttonText: "back",
        onPressed: onPressed);
  }
}
