import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final TextAlign textAlign;
  final int maxLines;
  final FontWeight? fontWeight;

  const HeadingText(
      {super.key,
      required this.text,
      this.fontSize = 26,
      this.color,
      this.textAlign = TextAlign.center,
      this.maxLines = 2,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Colors.white,
        shadows: const <Shadow>[
          Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 10.0,
             color: Color.fromARGB(36, 0, 0, 0),
          ),
          Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 10.0,
            color: Color.fromARGB(92, 0, 0, 0),
          ),
        ],
      ),
    );
  }
}
