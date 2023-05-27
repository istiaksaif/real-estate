import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../notifier/NotificationChangeNotifier.dart';
import '../notifier/notification_items_change_notifier.dart';
import '../utils/ColorUtils.dart';
import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../widget/notification_card.dart';

class LenderScreen extends StatelessWidget {
  const LenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLayout.systemHomeStatusColor(context);
    AppLayout.screenPortrait();
    final controller = Provider.of<NotificationChangeNotifier>(context);

    if (!controller.isLoaded) {
      controller.initState();
    }
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ColorStyles.backGroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: ColorStyles.primaryColor,
          elevation: 0.0,
          automaticallyImplyLeading:false,
          flexibleSpace: Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: AppLayout.getWidth(15),right: AppLayout.getWidth(20)),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child:
                    SvgPicture.asset('assets/images/ic_arrow_back.svg'),
                  ),
                ),
                Text(
                  'Lender Directory',
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  if (controller.courseModelList.isNotEmpty)
                    ListView(
                      children: [
                        Column(
                          children:
                          controller.courseModelList.asMap().entries.map((entry) {
                            final index = entry.key;
                            final popularCourse = entry.value;
                            return ChangeNotifierProvider<NotifyItemChangeNotifier>(
                              create: (context) =>
                                  NotifyItemChangeNotifier(pc: popularCourse),
                              child: NotificationCard(position: index),
                            );
                          }).toList(),
                        ),
                      ],
                    )
                  else
                    Shimmer.fromColors(
                      baseColor: ColorUtils.getShimmerBase(context),
                      highlightColor: ColorUtils.getShimmerHigh(context),
                      child: Container(
                        height: AppLayout.getScreenHeight(),
                        color: ColorUtils.getBackGround(context),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
