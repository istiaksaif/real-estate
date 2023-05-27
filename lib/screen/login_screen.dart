import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:real_estate/screen/registration_screen.dart';
import 'package:real_estate/widget/button/CustomButtonDark.dart';
import 'package:real_estate/widget/button/CustomButtonLight.dart';
import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../widget/textFiled/CustomPassWordFiledPassWord.dart';
import '../widget/textFiled/CustomTextFiled.dart';
import 'home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _textEmailController = TextEditingController();
  TextEditingController _textPasswordController = TextEditingController();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPass = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textEmailController.dispose();
    _textPasswordController.dispose();
    focusEmail.dispose();
    focusPass.dispose();
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
                      'Log in',
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "Outfit",
                        fontWeight: FontWeight.w500,
                        color: ColorStyles.textColorGrey,
                      ),
                    ),
                  ),
                  Gap(AppLayout.getHeight(20)),
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
                  Row(
                    children: [
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //     const GetVerifyNumberScreen(
                          //   from: "reset",
                          //   phone: '',
                          //   opacity: 1,
                          // ),
                          // ),
                          // );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppLayout.getWidth(20),
                              vertical: AppLayout.getHeight(15)),
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.textColorLight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(AppLayout.getHeight(50)),
                  Center(
                    child: Text(
                      'Or Login',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Outfit",
                        fontWeight: FontWeight.w500,
                        color: ColorStyles.textColorLight,
                      ),
                    ),
                  ),
                  Gap(AppLayout.getHeight(20)),
                  InkWell(
                    onTap: () {
                      focusChange();
                    },
                    child: Container(
                      height: AppLayout.getHeight(50),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.getWidth(15)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorStyles.primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'With Google',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                          SvgPicture.asset('assets/images/ic_google.svg')
                        ],
                      ),
                    ),
                  ),
                  Gap(AppLayout.getHeight(15)),
                  InkWell(
                    onTap: () {
                      focusChange();
                    },
                    child: Container(
                      height: AppLayout.getHeight(50),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.getWidth(15)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorStyles.primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'With Facebook',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                          SvgPicture.asset('assets/images/ic_fb.svg')
                        ],
                      ),
                    ),
                  ),
                  Gap(AppLayout.getScreenHeight() * .15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            focusChange();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationScreen()));
                          },
                          child: const CustomButtonLight(title: 'Sign Up',),
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
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: const Duration(milliseconds: 200), // Adjust the animation duration as desired
                                  pageBuilder: (_, __, ___) => const HomeScreen(),
                                  transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                                    return SlideTransition(
                                      position: Tween<Offset>(
                                        begin: const Offset(1.0, 0.0),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: child,
                                    );
                                  },
                                ),
                              );
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
                                    msg: "minimum 8 characters password!",
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
                          child: const CustomButtonDark(title: 'Sign In',),
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
  }
}
