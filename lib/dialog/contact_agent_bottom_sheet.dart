import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/widget/button/CustomButtonGray.dart';
import 'package:real_estate/widget/button/CustomButtonLight.dart';
import '../utils/ColorUtils.dart';
import '../utils/Constant.dart';
import '../utils/app_layout.dart';
import '../utils/app_pref.dart';
import '../utils/app_style.dart';
import '../widget/button/CustomButtonDark.dart';
import '../widget/image_widget.dart';

class ContactAgentBottomSheet {
  static Future<void> modalBottomSheetMenu(
    context,
  ) async {
    var selctedValue;
    await showModalBottomSheet(
        backgroundColor: ColorStyles.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppLayout.getHeight(13)),
            topRight: Radius.circular(AppLayout.getHeight(13)),
          ),
        ),
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorStyles.backGroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppLayout.getHeight(13)),
                      topRight: Radius.circular(AppLayout.getHeight(13)),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(23)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: AppLayout.getWidth(10)),
                        child: InkWell(
                          onTap: () {},
                          child: ImageWidget.imageWidget(
                            "https://marketplace.canva.com/EAFEits4-uw/1/0/800w/canva-boy-cartoon-gamer-animated-twitch-profile-photo-r0bPCSjUqg0.jpg",
                            ColorUtils.getBackGround(context),
                            AppLayout.getHeight(73),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            'James Smith',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 22,
                              height: 1.1,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.bold,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                          Text(
                            'The Real Estate LTD.',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.16,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w400,
                              color: ColorStyles.textColorGrey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Gap(AppLayout.getHeight(30)),
                Text(
                  'Contact James for more\ninformation',
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(30)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const CustomButtonGray(title: 'Call'),
                  ),
                ),
                Gap(AppLayout.getHeight(15)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(30)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const CustomButtonDark(title: 'E-mail'),
                  ),
                ),
                Gap(AppLayout.getHeight(55)),
              ],
            ),
          );
        });
    return selctedValue;
  }
}
