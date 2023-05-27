import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:real_estate/screen/account_info_screen.dart';

import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../widget/button/CustomButtonDark.dart';
import '../widget/button/CustomButtonLight.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    OtpTimerButtonController controller = OtpTimerButtonController();
    _requestOtp() {
      controller.loading();
      Future.delayed(Duration(seconds: 2), () {
        controller.startTimer();
      });
    }
    return Scaffold(
      backgroundColor: ColorStyles.backGroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: AppLayout.getWidth(15),bottom: AppLayout.getHeight(30)),
                      child: Text(
                        'Enter 6 Digit\nVerification Code',
                        style: TextStyle(
                          fontSize: 35,
                          height: 1,
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.textColorGrey,
                        ),
                      ),
                    ),
                    OTPTextField(
                      length: 6,
                      fieldWidth: 40,
                      width: AppLayout.getScreenWidth()-AppLayout.getWidth(40),
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorStyles.textColorDark,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Outfit",
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 10,
                      otpFieldStyle: OtpFieldStyle(
                        backgroundColor: ColorStyles.primaryColor,
                        focusBorderColor: Colors.transparent,
                        borderColor: ColorStyles.primaryColor,
                        enabledBorderColor: ColorStyles.primaryColor,
                      ),
                      onCompleted: (pin) {
                        print("Completed: " + pin);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OtpTimerButton(
                          controller: controller,
                          height: 60,
                          text: Text(
                            'Resend OTP',
                            style: TextStyle(
                              fontSize: 14,
                              height: 1,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                          duration: 60,
                          radius: 30,
                          backgroundColor: Colors.transparent,
                          textColor: Colors.white,
                          buttonType: ButtonType.text_button,
                          loadingIndicator: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: ColorStyles.textColorDark,
                          ),
                          loadingIndicatorColor: ColorStyles.textColorDark,
                          onPressed: () {
                            setState(() {
                              _requestOtp();
                            });
                          },
                        ),
                      ],
                    )
                  ],
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
                          Navigator.of(context).pop(true);
                        },
                        child: const CustomButtonLight(title: 'Cancel'),
                      ),
                    ),
                    Gap(AppLayout.getWidth(25)),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const AccountInfoScreen()), (route) => false);
                        },
                        child: const CustomButtonDark(title:'Verify'),
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
