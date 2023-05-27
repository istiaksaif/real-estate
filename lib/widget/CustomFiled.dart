import 'package:flutter/material.dart';

import '../../../utils/app_layout.dart';
import '../../../utils/app_style.dart';
import '../../utils/ColorUtils.dart';

class CustomFiled extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onChanged;
  final TextInputType keyboardType;
  final textAlign;


  const CustomFiled({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.keyboardType,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppLayout.getHeight(50),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(15)),
      margin: EdgeInsets.only(top: AppLayout.getHeight(10),bottom: AppLayout.getHeight(15)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorStyles.primaryColor,
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: textAlign==null?TextAlign.start:TextAlign.center,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: ColorStyles.textColorExtraLight,
            fontWeight: FontWeight.w500,
            fontFamily: "Outfit",
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        style: TextStyle(
          fontSize: 16,
          color: ColorUtils.getPrimaryText(context),
          fontWeight: FontWeight.w500,
          fontFamily: "Outfit",
        ),
        cursorColor: ColorStyles.indicateActiveColor,
        keyboardType: keyboardType,
        onChanged: (value){
          onChanged(value);
        },
      ),
    );
  }
}