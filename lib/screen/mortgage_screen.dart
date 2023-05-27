import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../notifier/NotificationChangeNotifier.dart';
import '../notifier/notification_items_change_notifier.dart';
import '../utils/ColorUtils.dart';
import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../widget/notification_card.dart';

class MortgageScreen extends StatefulWidget {
  const MortgageScreen({Key? key}) : super(key: key);

  @override
  State<MortgageScreen> createState() => _MortgageScreenState();
}

class _MortgageScreenState extends State<MortgageScreen> {
  final TextEditingController _textProfessionController =
      TextEditingController();
  int _selectedIndex = -1;

  void _selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLayout.systemHomeStatusColor(context);
    AppLayout.screenPortrait();

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ColorStyles.primaryColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: ColorStyles.primaryColor,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          flexibleSpace: Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: AppLayout.getWidth(15),
                      right: AppLayout.getWidth(20)),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset('assets/images/ic_arrow_back.svg'),
                  ),
                ),
                Text(
                  'Mortgage',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Outfit",
                    fontWeight: FontWeight.w600,
                    color: ColorStyles.textColorDark,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(2, (rowIndex) {
                  return Row(
                    children: List.generate(2, (columnIndex) {
                      final index = rowIndex * 2 + columnIndex;
                      final accountTypes = [
                        'Affordability Calculator',
                        'Mortgage Calculator',
                        'Refinance Calculator',
                        'Lender Directory',
                      ];
                      final accountType = accountTypes[index];
                      // final isSelected = _selectedIndex == index;
                      return Expanded(
                        child: InkWell(
                          onTap: () {
                            _selectTab(index);
                            _textProfessionController.text = accountType;
                          },
                          child: Container(
                            height: AppLayout.getHeight(64),
                            margin: columnIndex % 2 == 0
                                ? EdgeInsets.only(
                                    bottom: AppLayout.getHeight(10),
                                    right: AppLayout.getHeight(5),)
                                : EdgeInsets.only(
                                    bottom: AppLayout.getHeight(10),
                                    left: AppLayout.getHeight(5),),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: ColorStyles.mortgageCardBg,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: AppLayout.getWidth(20)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                accountType,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Outfit",
                                  fontWeight: FontWeight.w600,
                                  color: ColorStyles.textColorDark,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }),
                Gap(AppLayout.getHeight(15)),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Loan Options',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.bold,
                      color: ColorStyles.textColorDark,
                    ),
                  ),
                ),
                Container(
                  height: AppLayout.getHeight(130),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: ColorStyles.mortgageCardBg,
                  ),
                  margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(10)),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'loan Type',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w600,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                          Text(
                            '30 years fixed',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w400,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                          Text(
                            '15 years fixed',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w400,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                          Text(
                            '7/1',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w400,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Avg APR',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w600,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                          Text(
                            '6.63%',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                          Text(
                            '5.45%',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                          Text(
                            '8.13%',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Min. Down\nPayment',
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w600,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                          Text(
                            '3%',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                          Text(
                            '5%',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                          Text(
                            '3%',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(AppLayout.getHeight(15)),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'National Average\nInterest Rates',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.bold,
                      color: ColorStyles.textColorDark,
                    ),
                  ),
                ),
                Container(
                  height: AppLayout.getHeight(250),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: ColorStyles.mortgageCardBg,
                  ),
                  margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(15)),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(15)),
                  child: Chart(
                    layers: [
                      ChartAxisLayer(
                        settings: ChartAxisSettings(
                          x: ChartAxisSettingsAxis(
                            frequency: 1.0,
                            max: 12.0,
                            min: 1.0,
                            textStyle: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 10.0,
                            ),
                          ),
                          y: ChartAxisSettingsAxis(
                            frequency: 10.0,
                            max: 100.0,
                            min: 0.0,
                            textStyle: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                        labelX: (value) => value.toInt().toString(),
                        labelY: (value) => value.toInt().toString(),
                      ),
                      ChartLineLayer(
                        items: List.generate(
                          12 - 1 + 1,
                              (index) => ChartLineDataItem(
                            value: Random().nextInt(100) + 0,
                            x: index.toDouble() + 1,
                          ),
                        ),
                        settings: const ChartLineSettings(
                          thickness: 1.0,
                          color: const Color(0xFF16CFA3),
                        ),
                      ),
                      ChartLineLayer(
                        items: List.generate(
                          12 - 1 + 1,
                              (index) => ChartLineDataItem(
                            value: Random().nextInt(100) +0,
                            x: index.toDouble() + 1,
                          ),
                        ),
                        settings: const ChartLineSettings(
                          thickness: 1.0,
                          color: const Color(0xFFF52929),
                        ),
                      ),
                      ChartLineLayer(
                        items: List.generate(
                          12 - 1 + 1,
                              (index) => ChartLineDataItem(
                            value: Random().nextInt(100) - 0,
                            x: index.toDouble() + 1,
                          ),
                        ),
                        settings: const ChartLineSettings(
                          thickness: 1.0,
                          color: const Color(0xFFCE30A2),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
