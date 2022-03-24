// GLOBAL WIDGETS THESE ARE, CAREFULLY USE YOU WILL

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

Widget ImazeLogo() {
  return Container(
    child: Image.network(
        "https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2FLogo%2FImaze_white_text.png?alt=media&token=a5d0f0b5-7115-489f-b53f-81b2757301a9"),
  );
}

Widget DarkContatiner(Widget child,
    [EdgeInsets margin = const EdgeInsets.all(0)]) {
  return Container(
    margin: margin,
    decoration: BoxDecoration(
      color: Color(
        0xff45064C,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: child),
      ],
    ),
  );
}
