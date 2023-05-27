import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../notifier/home_change_notifier.dart';
import '../notifier/recent_sold_notifier.dart';
import '../utils/ColorUtils.dart';
import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../widget/home/assest_item_container.dart';
import '../widget/home/recent_sold_container.dart';

class SavedPropertyScreen extends StatelessWidget {
  const SavedPropertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLayout.systemHomeStatusColor(context);
    AppLayout.screenPortrait();
    final controller = Provider.of<HomeChangeNotifier>(context);

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
                  'Saved Homes',
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
        body: Stack(
          children: [
            if (controller.isLoaded)
              SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: controller.popularCourseList
                          .map((popularCourse) =>
                          ChangeNotifierProvider<RecentSoldNotifier>(
                            create: (context) =>
                                RecentSoldNotifier(pc: popularCourse),
                            child: const AssetsItemContainer(),
                          ))
                          .toList(),
                    ),
                    Gap(AppLayout.getHeight(70)),
                  ],
                ),
              ),
            if (!controller.isLoaded)
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
      ),
    );
  }
}
