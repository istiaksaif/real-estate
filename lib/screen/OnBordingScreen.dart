import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate/screen/login_screen.dart';
import 'package:real_estate/utils/app_pref.dart';
import 'package:real_estate/widget/button/CustomButtonLight.dart';
import '../utils/app_layout.dart';
import '../utils/app_style.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: demo_data.length,
              controller: _pageController,
              itemBuilder: (context, index) => OnBoardingContent(
                image: demo_data[index].image,
                title: demo_data[index].title,
                buttonText: demo_data[index].buttonText,
                titleColor: demo_data[index].titleColor,
                onTapChanged: (value) {
                  if(value && index<demo_data.length-1) {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }else {
                    AppPref.sharedPref("firstTime", false);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogInScreen(),
                      ),
                    );
                  }
                },
                skipBtn: demo_data[index].skipBtn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  final String image, title, buttonText;
  final titleColor;
  final bool skipBtn;
  final Function onTapChanged;

  const OnBoardingContent(
      {Key? key,
      required this.image,
      required this.title,
      required this.buttonText,
      this.titleColor,
      required this.onTapChanged,
      required this.skipBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: AppLayout.getHeight(120),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 43,
                  height: .89,
                  fontFamily: "Outfit",
                  fontWeight: FontWeight.w500,
                  color: titleColor,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: AppLayout.getHeight(180),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(.0),
                  Colors.black.withOpacity(.81),
                  Colors.black
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(30)),
              child: Row(
                children: [
                  if (skipBtn)
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          onTapChanged(false);
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(right: AppLayout.getWidth(10)),
                          child: Container(
                            height: AppLayout.getHeight(45),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: Colors.white.withOpacity(.3),
                            ),
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        onTapChanged(true);
                      },
                      child: Padding(
                        padding: skipBtn
                            ? EdgeInsets.only(left: AppLayout.getWidth(10))
                            : EdgeInsets.zero,
                        child: CustomButtonLight(title: buttonText,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OnBoard {
  final String image, title, buttonText;
  final titleColor;
  final bool skipBtn;

  OnBoard({
    required this.image,
    required this.title,
    required this.buttonText,
    this.titleColor,
    required this.skipBtn,
  });
}

List<OnBoard> demo_data = [
  OnBoard(
    image: 'assets/images/onboarding_1.webp',
    title: 'WE BUILT\nWITH LOVE\nPLACE IT\nINTO\nHEART',
    buttonText: 'Get Started',
    titleColor: ColorStyles.primaryColor,
    skipBtn: false,
  ),
  OnBoard(
    image: 'assets/images/onboarding_2.webp',
    title: 'WE TURN\nYOUR\nDREAM\nINTO\nREALITY',
    buttonText: 'Next',
    titleColor: ColorStyles.primaryColor,
    skipBtn: true,
  ),
  OnBoard(
    image: 'assets/images/onboarding_3.webp',
    title: 'FIND THE\nBEST\nHOME\nIN OUR\nBELOVED\nPLANET',
    buttonText: 'Next',
    titleColor: ColorStyles.primaryColor,
    skipBtn: false,
  )
];
