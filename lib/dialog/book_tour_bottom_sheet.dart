import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:real_estate/widget/button/CustomButtonLight.dart';
import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../widget/button/CustomButtonDark.dart';

class BookTourDialog extends StatefulWidget {
  @override
  _BookTourDialogState createState() => _BookTourDialogState();

  static Future<void> modalBottomSheetMenu(BuildContext context) async {
    bool? isSwitched = false;
    bool? isAgree = false;
    List<int> excludedDays = [];
    for (int i = 15; i < 24; i++) {
      excludedDays.add(i);
    }
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
        return StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.getWidth(30),
                      vertical: AppLayout.getHeight(35),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Available Dates:',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 20,
                                height: 1.12,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w500,
                                color: ColorStyles.textColorDark,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                'assets/images/ic_cross.svg',
                              ),
                            ),
                          ],
                        ),
                        Gap(AppLayout.getHeight(10)),
                        CalendarTimeline(
                          initialDate: DateTime(2023, 5, 25),
                          firstDate: DateTime(2023, 5, 15),
                          lastDate: DateTime(2023, 5, 30),
                          onDateSelected: (date) => print(date),
                          leftMargin: 0,
                          monthColor: Colors.blueGrey,
                          dayColor: ColorStyles.textColorDark,
                          activeDayColor: Colors.white,
                          activeBackgroundDayColor: ColorStyles.textColorDark,
                          dotsColor: Colors.blueGrey,
                          selectableDayPredicate: (date) =>
                          !excludedDays.contains(date.day),
                          locale: 'en_ISO',
                        ),
                        Gap(AppLayout.getHeight(30)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const CustomButtonLight(title: 'In-Person'),
                              ),
                            ),
                            Gap(AppLayout.getHeight(15)),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const CustomButtonDark(title: 'Video Chat'),
                              ),
                            ),
                          ],
                        ),
                        Gap(AppLayout.getHeight(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isSwitched = !isSwitched!;
                                });
                              },
                              child: Material(
                                type: MaterialType.transparency,
                                child: Ink(
                                  padding: EdgeInsets.zero, // Remove padding
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: isSwitched!
                                          ? ColorStyles.textColorDark
                                          : const Color(0xFFD7D7D7),
                                      width: 1.5,
                                    ),
                                    color: isSwitched!
                                        ? ColorStyles.textColorDark
                                        : ColorStyles.primaryColor,
                                  ),
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: isSwitched!
                                        ? Icon(
                                      Icons.check,
                                      color: ColorStyles.primaryColor,
                                      size: 16,
                                    )
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                            Gap(AppLayout.getHeight(10)),
                            Text(
                              'Want to talk about financing',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.12,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w400,
                                color: ColorStyles.textColorDark,
                              ),
                            ),
                          ],
                        ),
                        Gap(AppLayout.getHeight(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isAgree = !isAgree!;
                                });
                              },
                              child: Material(
                                type: MaterialType.transparency,
                                child: Ink(
                                  padding: EdgeInsets.zero, // Remove padding
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: isAgree!
                                          ? ColorStyles.textColorDark
                                          : const Color(0xFFD7D7D7),
                                      width: 1.5,
                                    ),
                                    color: isAgree!
                                        ? ColorStyles.textColorDark
                                        : ColorStyles.primaryColor,
                                  ),
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: isAgree!
                                        ? Icon(
                                      Icons.check,
                                      color: ColorStyles.primaryColor,
                                      size: 16,
                                    )
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                            Gap(AppLayout.getHeight(10)),
                            Text(
                              'I agree with terms and conditions',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.12,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w400,
                                color: ColorStyles.textColorDark,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: AppLayout.getScreenWidth(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: const Color(0xFFF5F5F5),
                      ),
                      margin: EdgeInsets.symmetric(
                          vertical: AppLayout.getHeight(12),
                          horizontal: AppLayout.getWidth(20)),
                      padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.getWidth(20.0),
                          vertical: AppLayout.getHeight(15)),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child:
                            SvgPicture.asset('assets/images/ic_info.svg'),
                          ),
                          Text(
                            'By requesting a tour, you agree that Company and real estate professionals may contact you via phone/text about your inquiry, which may involve the use of automated means. You are not required to consent as a condition of purchasing any property, goods or services. Message/data rates may apply. You also agree to our Terms of Use Company does not endorse any real estate professionals.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.55,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w200,
                              color: ColorStyles.textColorGrey,
                            ),
                          ),
                        ],
                      )),
                  Gap(AppLayout.getHeight(30)),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _BookTourDialogState extends State<BookTourDialog> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
