import 'package:flutter/cupertino.dart';

class CustomTextWidget extends StatelessWidget {
  String text, fontFamily;
  FontWeight weight;
  double fontSize;
  Color color;
  CustomTextWidget(
      this.text, this.fontFamily, this.weight, this.fontSize, this.color,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: weight,
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
