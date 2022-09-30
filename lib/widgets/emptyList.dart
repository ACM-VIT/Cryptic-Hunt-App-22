import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key, required this.description, required this.title});
  final title;
  final description;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            style:
                Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 14),
          )
        ],
      ),
    );
  }
}
