import 'package:flutter/material.dart';
import '../../utils/app_layout.dart';
import '../../utils/app_style.dart';

class CustomButtonLight extends StatelessWidget {
  final String title;
  const CustomButtonLight({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppLayout.getHeight(45),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(15)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: ColorStyles.primaryColor,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontFamily: "Outfit",
          fontWeight: FontWeight.w500,
          color: ColorStyles.textColorDark,
        ),
      ),
    );
  }
}
