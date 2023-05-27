import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:real_estate/screen/otp_verify_screen.dart';

import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../widget/button/CustomButtonDark.dart';
import '../widget/button/CustomButtonLight.dart';

class SendVerifyScreen extends StatelessWidget {
  const SendVerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLayout.systemStatusColor(context);
    AppLayout.screenPortrait();
    return Scaffold(
      backgroundColor: ColorStyles.backGroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.only(left: AppLayout.getWidth(40)),
                child: Text(
                  'Verify Phone\nNumber',
                  style: TextStyle(
                    fontSize: 35,
                    height: 1,
                    fontFamily: "Outfit",
                    fontWeight: FontWeight.w500,
                    color: ColorStyles.textColorGrey,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: AppLayout.getHeight(80),
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const CustomButtonLight(title: 'Cancel'),
                      ),
                    ),
                    Gap(AppLayout.getWidth(25)),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const OtpVerifyScreen()));
                        },
                        child: const CustomButtonDark(title:'Send Code'),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
