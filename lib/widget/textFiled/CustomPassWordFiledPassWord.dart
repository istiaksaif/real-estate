import 'package:flutter/material.dart';

import '../../../utils/app_layout.dart';
import '../../../utils/app_style.dart';
import '../../utils/ColorUtils.dart';

class CustomPassWordField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onChanged;
  final TextInputType keyboardType;
  final bool password;

  const CustomPassWordField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.keyboardType, required this.password,
  }) : super(key: key);

  @override
  State<CustomPassWordField> createState() => _CustomPassWordFieldState();
}

class _CustomPassWordFieldState extends State<CustomPassWordField> {
  bool _passWord = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _passWord = widget.password;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppLayout.getHeight(55),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(15)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorStyles.primaryColor,
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: ColorStyles.textColorExtraLight,
            fontWeight: FontWeight.w500,
            fontFamily: "Outfit",
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _passWord = !_passWord; // toggle visibility state
              });
            },
            child: Icon(
              _passWord
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: ColorStyles.textColorExtraLight,
            ),
          ),
        ),
        style: TextStyle(
          fontSize: 16,
          color: ColorUtils.getPrimaryText(context),
          fontWeight: FontWeight.w500,
          fontFamily: "Outfit",
        ),
        cursorColor: ColorStyles.indicateActiveColor,
        keyboardType: widget.keyboardType,
        onChanged: (value){
          widget.onChanged(value);
        },
        obscureText: _passWord,
      ),
    );
  }
}