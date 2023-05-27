import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:real_estate/screen/home_screen.dart';

import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../widget/VerticalSeekBar.dart';
import '../widget/button/CustomButtonDark.dart';
import '../widget/button/CustomButtonLight.dart';
import '../widget/textFiled/CustomTextFiled.dart';

class QNAScreen extends StatefulWidget {
  const QNAScreen({Key? key}) : super(key: key);

  @override
  State<QNAScreen> createState() => _QNAScreenState();
}

class _QNAScreenState extends State<QNAScreen> {
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
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => QNAContent(
                image: demo_data[index].image,
                title: demo_data[index].title,
                buttonText: demo_data[index].buttonText,
                secondButtonText: demo_data[index].secondButtonText,
                thirdButtonText: demo_data[index].thirdButtonText,
                pageNumber: index,
                editTextHint: demo_data[index].editTextHint,
                bgColor: demo_data[index].bgColor,
                onTapChanged: (value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                onSecondTapChanged: (value) {
                  if (value && index < demo_data.length - 1) {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.ease);
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                },
                onThirdTapChanged: (value){
                  if (value && index < demo_data.length - 1) {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.ease);
                  } else {
                    // AppPref.sharedPref("firstTimeQNA", false);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QNAContent extends StatelessWidget {
  final String title, buttonText, secondButtonText;
  final Function onTapChanged;
  final Function onSecondTapChanged;
  final Function? onThirdTapChanged;
  final bgColor;
  final String? image;
  final String? thirdButtonText;
  final String? editTextHint;
  final int? pageNumber;

  const QNAContent(
      {Key? key,
      this.image,
      required this.title,
      required this.buttonText,
      required this.secondButtonText,
      this.thirdButtonText,
      this.pageNumber,
      this.editTextHint,
      required this.onTapChanged,
      this.bgColor,
      required this.onSecondTapChanged,
      this.onThirdTapChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textFirstNameController = TextEditingController();
    FocusNode focusFirstName = FocusNode();
    TextEditingController _textMinController = TextEditingController();
    FocusNode focusMin = FocusNode();
    TextEditingController _textMaxController = TextEditingController();
    FocusNode focusMax = FocusNode();
    return GestureDetector(
      onTap: () {
        focusFirstName.unfocus();
        focusMin.unfocus();
        focusMax.unfocus();
      },
      child: Stack(
        children: [
          Container(
            color: bgColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(40)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 35,
                      height: 1,
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.w500,
                      color: ColorStyles.textColorGrey,
                    ),
                  ),
                ),
                pageNumber! == 1 || pageNumber! == 2
                    ? Gap(AppLayout.getHeight(70))
                    : Gap(AppLayout.getHeight(20)),
                pageNumber! == 3 || pageNumber! > 5
                    ? CustomTextField(
                        hintText: editTextHint!,
                        controller: _textFirstNameController,
                        focusNode: focusFirstName,
                        onChanged: (value) {},
                        keyboardType: pageNumber! == 3
                            ? TextInputType.text
                            : TextInputType.number)
                    : Container(),
                pageNumber! == 4 || pageNumber! == 5
                    ? Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  hintText: 'Minimum',
                                  controller: _textMinController,
                                  focusNode: focusMin,
                                  onChanged: (value) {},
                                  keyboardType: TextInputType.number,
                                  textAlign: true,
                                ),
                              ),
                              Gap(AppLayout.getWidth(20)),
                              Expanded(
                                child: CustomTextField(
                                  hintText: 'Maximum',
                                  controller: _textMaxController,
                                  focusNode: focusMax,
                                  onChanged: (value) {},
                                  keyboardType: TextInputType.number,
                                  textAlign: true,
                                ),
                              ),
                            ],
                          ),
                          VerticalSeekBar(
                            thumbColor: Colors.white,
                            progressColor: ColorStyles.textColorDark,
                            backgroundColor: ColorStyles.track_tint_bg,
                            onChangedValue: (value) {
                              double timeValue = value * 100;
                              // setState(() {
                              //   setTime = timeValue.toInt();
                              // });
                            },
                            maxValue: 200.0,
                            minValue: 0.0,
                            startValue: 50.0,
                            endValue: 150.0,
                          ),
                        ],
                      )
                    : Container(),
                pageNumber! >= 3 //&& pageNumber! < 6
                    ? Gap(AppLayout.getHeight(20))
                    : const Gap(0),
                pageNumber! == 3
                    ? SvgPicture.asset('assets/images/ic_add.svg')
                    : Container(),
                pageNumber! == 0
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child:
                            SvgPicture.asset('assets/images/emoji_smile.svg'))
                    : Container(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                thirdButtonText != null
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppLayout.getWidth(30)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      onThirdTapChanged!(true);
                                    },
                                    child: CustomButtonDark(
                                      title: thirdButtonText!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Gap(AppLayout.getHeight(15)),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      onSecondTapChanged(true);
                                    },
                                    child: CustomButtonDark(
                                      title: secondButtonText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Gap(AppLayout.getHeight(15)),
                          ],
                        ),
                      )
                    : Container(),
                Container(
                  height: AppLayout.getHeight(130),
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.getWidth(30)),
                    child: thirdButtonText != null
                        ? Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    onTapChanged(true);
                                  },
                                  child: CustomButtonLight(
                                    title: buttonText,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    onTapChanged(true);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: AppLayout.getWidth(10)),
                                    child: CustomButtonLight(
                                      title: buttonText,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    onSecondTapChanged(true);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: AppLayout.getWidth(10)),
                                    child: CustomButtonDark(
                                      title: secondButtonText,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoard {
  final String title, buttonText, secondButtonText;
  final bgColor;
  final String? image;
  final String? thirdButtonText;
  final String? editTextHint;

  OnBoard({
    this.image,
    required this.title,
    required this.buttonText,
    required this.secondButtonText,
    this.thirdButtonText,
    this.bgColor,
    this.editTextHint,
  });
}

List<OnBoard> demo_data = [
  OnBoard(
    image: 'assets/images/onboarding_1.webp',
    title: 'Answer some\nquestions to find\neasily and faster',
    buttonText: 'No',
    secondButtonText: 'Yes',
    bgColor: ColorStyles.qna_bg_1,
  ),
  OnBoard(
    title: 'Do you want to\nbuy or rent?\n',
    buttonText: 'Skip',
    secondButtonText: 'Rent',
    thirdButtonText: 'Buy',
    bgColor: ColorStyles.qna_bg_2,
  ),
  OnBoard(
    title: 'Do you prefer\nresidential or\ncommercial?\n',
    buttonText: 'Skip',
    secondButtonText: 'Residential',
    thirdButtonText: 'Commercial',
    bgColor: ColorStyles.qna_bg_3,
  ),
  OnBoard(
    title: 'Locations you\nprefer...',
    buttonText: 'Skip',
    secondButtonText: 'Next',
    bgColor: ColorStyles.qna_bg_4,
    editTextHint: 'Location',
  ),
  OnBoard(
    title: 'How much do\nyou want to pay\nfor it?',
    buttonText: 'Skip',
    secondButtonText: 'Next',
    bgColor: ColorStyles.qna_bg_5,
  ),
  OnBoard(
    title: 'How many\nsquare feet do\nyou want?',
    buttonText: 'Skip',
    secondButtonText: 'Next',
    bgColor: ColorStyles.qna_bg_6,
  ),
  OnBoard(
    title: 'How many\nbedrooms do\nyou want?',
    buttonText: 'Skip',
    secondButtonText: 'Next',
    bgColor: ColorStyles.qna_bg_7,
    editTextHint: 'Number of Beds',
  ),
  OnBoard(
    image: 'assets/images/onboarding_1.webp',
    title: 'How many\nbathrooms do\nyou want?',
    buttonText: 'Skip',
    secondButtonText: 'Next',
    bgColor: ColorStyles.qna_bg_8,
    editTextHint: 'Number of Baths',
  ),
];
