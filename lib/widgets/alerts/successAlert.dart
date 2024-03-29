import 'package:cryptic_hunt/widgets/alerts/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SuccessAlert extends StatelessWidget {
  const SuccessAlert({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    // return AlertDialog(
    //   title: const Text('Success'),
    //   content: SingleChildScrollView(
    //     child: ListBody(
    //       children: const <Widget>[
    //         Text('This is a demo alert dialog.'),
    //         Text('Would you like to approve of this message?'),
    //       ],
    //     ),
    //   ),
    //   actions: <Widget>[
    //     TextButton(
    //       child: const Text('Go Back'),
    //       onPressed: onPressed,
    //     ),
    //   ],
    // );

    return CustomAlertDialog(
        title: "Success", buttonText: "Woohoo!!", onPressed: onPressed);
  }
}
