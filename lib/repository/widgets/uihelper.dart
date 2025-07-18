import 'package:flutter/material.dart';

class Uihelper {
  static customimage({required String img}) {
    return Image.asset('assets/images/$img');
  }

  static customText({
    required String text,
    required Color color,
    required FontWeight fontweight,
    String? fontfamily,
    required double fontsize,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: fontfamily ?? "regular",
        fontWeight: fontweight,
        color: color,
      ),
    );
  }
}
