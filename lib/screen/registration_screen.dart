import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:real_estate/screen/send_verify_screen.dart';
import 'package:real_estate/widget/button/CustomButtonLight.dart';
import 'package:real_estate/widget/textFiled/CustomPassWordFiledPassWord.dart';
import 'package:real_estate/widget/textFiled/CustomTextFiled.dart';

import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../widget/button/CustomButtonDark.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _textUsernameController = TextEditingController();
  TextEditingController _textEmailController = TextEditingController();
  TextEditingController _textNumberController = TextEditingController();
  TextEditingController _textPasswordController = TextEditingController();
  TextEditingController _textPasswordConfirmController =
      TextEditingController();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPass = FocusNode();
  FocusNode focusConfirmPass = FocusNode();
  FocusNode focusNumber = FocusNode();
  FocusNode focusUsername = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textEmailController.dispose();
    _textPasswordController.dispose();
    _textPasswordConfirmController.dispose();
    _textNumberController.dispose();
    _textUsernameController.dispose();
    focusEmail.dispose();
    focusPass.dispose();
    focusConfirmPass.dispose();
    focusNumber.dispose();
    focusUsername.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLayout.systemStatusColor(context);
    AppLayout.screenPortrait();
    return GestureDetector(
      onTap: () {
        focusChange();
      },
      child: Scaffold(
        backgroundColor: ColorStyles.backGroundColor,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppLayout.getHeight(30),
                horizontal: AppLayout.getWidth(25)),
            child: SizedBox(
              height: AppLayout.getScreenHeight(),
              width: AppLayout.getScreenWidth(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: AppLayout.getWidth(15)),
                    child: Text(
                      'Create\nAccount',
                      style: TextStyle(
                        fontSize: 35,
                        height: 1,
                        fontFamily: "Outfit",
                        fontWeight: FontWeight.w500,
                        color: ColorStyles.textColorGrey,
                      ),
                    ),
                  ),
                  Gap(AppLayout.getHeight(20)),
                  CustomTextField(
                      hintText: 'Username',
                      controller: _textUsernameController,
                      focusNode: focusUsername,
                      onChanged: (value) {
                        if (!focusUsername.hasFocus) {
                          _textUsernameController.text = value;
                        }
                      },
                      keyboardType: TextInputType.text),
                  Gap(AppLayout.getHeight(15)),
                  CustomTextField(
                      hintText: 'E-mail',
                      controller: _textEmailController,
                      focusNode: focusEmail,
                      onChanged: (value) {
                        if (!focusEmail.hasFocus) {
                          _textEmailController.text = value;
                        }
                      },
                      keyboardType: TextInputType.emailAddress),
                  Gap(AppLayout.getHeight(15)),
                  Container(
                    height: AppLayout.getHeight(55),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.getWidth(15)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorStyles.primaryColor,
                    ),
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                        labelText: null,
                        hintText: 'Phone',
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
                        color: ColorStyles.textColorDark,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Outfit",
                      ),
                      showDropdownIcon: false,
                      disableLengthCheck: true,
                      cursorColor: ColorStyles.indicateActiveColor,
                      initialCountryCode: 'BD',
                      invalidNumberMessage: null,
                      onChanged: (phone) {
                        _textNumberController.text = phone.completeNumber;
                      },
                    ),
                  ),
                  Gap(AppLayout.getHeight(15)),
                  CustomPassWordField(
                      hintText: 'Password',
                      controller: _textPasswordController,
                      focusNode: focusPass,
                      onChanged: (value) {
                        if (!focusPass.hasFocus) {
                          _textPasswordController.text = value;
                        }
                      },
                      keyboardType: TextInputType.visiblePassword,
                      password: true),
                  Gap(AppLayout.getHeight(15)),
                  CustomPassWordField(
                      hintText: 'Confirm Password',
                      controller: _textPasswordConfirmController,
                      focusNode: focusConfirmPass,
                      onChanged: (value) {
                        if (!focusConfirmPass.hasFocus) {
                          _textPasswordConfirmController.text = value;
                        }
                      },
                      keyboardType: TextInputType.visiblePassword,
                      password: true),
                  Gap(AppLayout.getScreenHeight() * .15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            focusChange();
                            Navigator.of(context).pop();
                          },
                          child: const CustomButtonLight(title: 'Cancel'),
                        ),
                      ),
                      Gap(AppLayout.getWidth(25)),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            focusChange();
                            if (_textEmailController.text.isNotEmpty &&
                                _textPasswordController.text.isNotEmpty &&
                                _textPasswordController.text.length >= 8) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SendVerifyScreen()));
                            } else {
                              if (_textEmailController.text.isEmpty) {
                                Fluttertoast.showToast(
                                  msg: "write e-mail",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: ColorStyles.primaryColor,
                                  fontSize: 12.0,
                                );
                              } else if (_textPasswordController.text.isEmpty) {
                                Fluttertoast.showToast(
                                  msg: "write password",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: ColorStyles.primaryColor,
                                  fontSize: 12.0,
                                );
                              } else if (_textPasswordController
                                  .text.isNotEmpty) {
                                if (_textPasswordController.text.length < 8) {
                                  Fluttertoast.showToast(
                                    msg: "কমপক্ষে ৮ ডিজিটের পাসওয়ার্ড লিখুন",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black,
                                    textColor: ColorStyles.primaryColor,
                                    fontSize: 12.0,
                                  );
                                }
                              }
                            }
                          },
                          child: const CustomButtonDark(title:'Create Account'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void focusChange() {
    focusEmail.unfocus();
    focusPass.unfocus();
    focusConfirmPass.unfocus();
    focusNumber.unfocus();
    focusUsername.unfocus();
  }
}
