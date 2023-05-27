import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/widget/button/CustomButtonLight.dart';
import '../utils/Constant.dart';
import '../utils/app_layout.dart';
import '../utils/app_pref.dart';
import '../utils/app_style.dart';
import '../widget/button/CustomButtonDark.dart';
import '../widget/image_widget.dart';

class SheetData {
  static Future<void> modalBottomSheetMenu(
    context,
    // List<UserModel> userList,
    // String currentUserName,
  ) async {
    var selctedValue;
    await showModalBottomSheet(
        backgroundColor: ColorStyles.backGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppLayout.getHeight(13)),
            topRight: Radius.circular(AppLayout.getHeight(13)),
          ),
        ),
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(30),vertical: AppLayout.getHeight(35)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/ic_bottom_sheet_home.svg'),
                  Gap(AppLayout.getHeight(30)),
                  Text(
                    'Contact with our team for\nguidance or details',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      height: 1.12,
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.w500,
                      color: ColorStyles.textColorDark,
                    ),
                  ),
                  Gap(AppLayout.getHeight(30)),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const CustomButtonLight(title: 'Call'),
                  ),
                  Gap(AppLayout.getHeight(15)),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const CustomButtonDark(title: 'E-mail'),
                  ),
                  Gap(AppLayout.getHeight(20)),
                ],
              ),
            ),
          );
        });
    return selctedValue;
  }
}
