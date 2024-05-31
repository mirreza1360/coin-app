import 'package:flutter/material.dart';

class AppColors {
  static const Color bgColor = Color(0xFFF5F5F5);
  static const Color secondaryColor = Color(0xFF00BCD4);
  static const Color greyColor = Color(0xFF9E9E9E);
  static const Color lightGreyColor = Color(0xFFB2B2B2);
  static const Color blackColor = Color(0xFF000000);
  static const Color lightColor = Color(0xFFD2D2D2);
  static const Color redColor = Color(0xFFFF5499);
}

class AppTextStyle extends StatelessWidget {
  final String title;
  final Color color;
  final double fs;
  final FontWeight? fw;

  const AppTextStyle(
      {super.key,
      required this.title,
      required this.color,
      required this.fs,
      this.fw});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: fs, fontWeight: fw, color: color),
    );
  }
}
