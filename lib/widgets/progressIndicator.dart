import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OwlProgressIndicator extends StatelessWidget {
  const OwlProgressIndicator(
      {super.key,
      this.description = "Please wait for sometime",
      this.title = "Loading..."});
  final title;
  final description;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/Owl-4.svg', height: 80),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontSize: 14),
                )
              ],
            ),
          ),
        ),
        LinearProgressIndicator(),
      ],
    );
  }
}
