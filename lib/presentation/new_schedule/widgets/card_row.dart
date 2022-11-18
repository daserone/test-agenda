import 'package:flutter/material.dart';

@override
Widget textRow(BuildContext context, String text1, String text2) {
  return RichText(
    text: TextSpan(
      text: text1,
      style:
          const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      children: <TextSpan>[
        TextSpan(
            text: text2, style: const TextStyle(fontWeight: FontWeight.normal)),
      ],
    ),
  );
}
