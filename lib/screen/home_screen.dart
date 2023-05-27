import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/dialog/account_dialog.dart';
import 'package:real_estate/screen/mortgage_screen.dart';
import 'package:real_estate/screen/notification_screen.dart';
import 'package:real_estate/screen/notification_settings_screen.dart';
import 'package:real_estate/screen/profile_screen.dart';
import 'package:real_estate/widget/button/CustomButtonLight.dart';
import 'package:shimmer/shimmer.dart';

import '../notifier/home_change_notifier.dart';
import '../notifier/recent_sold_notifier.dart';
import '../utils/ColorUtils.dart';
import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../widget/TooltipShape.dart';
import '../widget/button/CustomButtonDark.dart';
import '../widget/home/assest_item_container.dart';
import '../widget/home/recent_sold_container.dart';
import '../widget/image_widget.dart';
import '../dialog/show_bottom_sheet.dart';
import 'saved_proparty_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeChangeNotifier>(context);

    if (!controller.isLoaded) {
      controller.initState();
    }
    AppLayout.systemHomeStatusColor(context);
    AppLayout.screenPortrait();
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ColorStyles.backGroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: ColorStyles.primaryColor,
          elevation: 0.0,
          actions: [
            Theme(
                data: Theme.of(context).copyWith(
                  dividerTheme: DividerThemeData(
                    color: ColorStyles.lineColor,
                  ),
                  iconTheme: IconThemeData(color: Colors.black),
                  textTheme: TextTheme().apply(bodyColor: Colors.black),
                ),
                child: PopupMenuButton(
                  offset: Offset(0, 50),
                  shape: const TooltipShape(),
                  itemBuilder: (_) => <PopupMenuEntry>[
                    PopupMenuItem(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            SvgPicture.asset('assets/images/ic_monitize.svg'),
                            Gap(AppLayout.getWidth(15)),
                            Text(
                              'Mortgage',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15,
                                height: 0.82,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w400,
                                color: ColorStyles.textColorDark,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 200),
                              // Adjust the animation duration as desired
                              pageBuilder: (_, __, ___) => const MortgageScreen(),
                              transitionsBuilder:
                                  (_, Animation<double> animation, __, Widget child) {
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
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            SvgPicture.asset('assets/images/ic_saved_property.svg'),
                            Gap(AppLayout.getWidth(15)),
                            Text(
                              'Saved Homes',
                              style: TextStyle(
                                fontSize: 15,
                                height: 0.82,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w400,
                                color: ColorStyles.textColorDark,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 200),
                              // Adjust the animation duration as desired
                              pageBuilder: (_, __, ___) => const SavedPropertyScreen(),
                              transitionsBuilder:
                                  (_, Animation<double> animation, __, Widget child) {
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
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            SvgPicture.asset('assets/images/ic_pre_qualify.svg'),
                            Gap(AppLayout.getWidth(15)),
                            Text(
                              'Get Pre-Qualified',
                              style: TextStyle(
                                fontSize: 15,
                                height: 0.82,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w400,
                                color: ColorStyles.textColorDark,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const PopupMenuDivider(height: 1,),
                    PopupMenuItem(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            SvgPicture.asset('assets/images/ic_person.svg'),
                            Gap(AppLayout.getWidth(15)),
                            Text(
                              'Profile Settings',
                              style: TextStyle(
                                fontSize: 15,
                                height: 0.82,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w400,
                                color: ColorStyles.textColorDark,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 200),
                              // Adjust the animation duration as desired
                              pageBuilder: (_, __, ___) => const ProfileScreen(),
                              transitionsBuilder:
                                  (_, Animation<double> animation, __, Widget child) {
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
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            SvgPicture.asset('assets/images/ic_notification.svg',width: 20,height: 24,fit: BoxFit.cover,),
                            Gap(AppLayout.getWidth(15)),
                            Text(
                              'Notification Settings',
                              style: TextStyle(
                                fontSize: 15,
                                height: 0.82,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w400,
                                color: ColorStyles.textColorDark,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 200),
                              // Adjust the animation duration as desired
                              pageBuilder: (_, __, ___) => const NotificationSettingsScreen(),
                              transitionsBuilder:
                                  (_, Animation<double> animation, __, Widget child) {
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
                        },
                      ),
                    ),
                    const PopupMenuDivider(height: 1,),
                    PopupMenuItem(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Terms of Use',
                          style: TextStyle(
                            fontSize: 15,
                            height: 0.82,
                            fontFamily: "Outfit",
                            fontWeight: FontWeight.w400,
                            color: ColorStyles.textColorDark,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: 15,
                            height: 0.82,
                            fontFamily: "Outfit",
                            fontWeight: FontWeight.w400,
                            color: ColorStyles.textColorDark,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Copyrights',
                          style: TextStyle(
                            fontSize: 15,
                            height: 0.82,
                            fontFamily: "Outfit",
                            fontWeight: FontWeight.w400,
                            color: ColorStyles.textColorDark,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Help',
                          style: TextStyle(
                            fontSize: 15,
                            height: 0.82,
                            fontFamily: "Outfit",
                            fontWeight: FontWeight.w400,
                            color: ColorStyles.textColorDark,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'About',
                          style: TextStyle(
                            fontSize: 15,
                            height: 0.82,
                            fontFamily: "Outfit",
                            fontWeight: FontWeight.w400,
                            color: ColorStyles.textColorDark,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ))
          ],
          flexibleSpace: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: AppLayout.getWidth(15)),
                  child: InkWell(
                    onTap: () {
                      AccountDialog.modalBottomSheetMenu(context);
                    },
                    child: ImageWidget.imageWidget(
                      "https://marketplace.canva.com/EAFEits4-uw/1/0/800w/canva-boy-cartoon-gamer-animated-twitch-profile-photo-r0bPCSjUqg0.jpg",
                      ColorUtils.getBackGround(context),
                      AppLayout.getHeight(35),
                    ),
                  ),
                ),
                Gap(AppLayout.getWidth(15)),
                Expanded(
                    child: Container(
                  height: AppLayout.getHeight(35),
                  alignment: Alignment.centerLeft,
                  padding:
                      EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: ColorStyles.backGroundColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(
                          'assets/images/ic_search.svg',
                        ),
                      ),
                      Gap(AppLayout.getWidth(5)),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: ColorStyles.textColorLight,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Outfit",
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorStyles.textColorDark,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Outfit",
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                )),
                Gap(AppLayout.getWidth(15)),
                InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 200),
                        // Adjust the animation duration as desired
                        pageBuilder: (_, __, ___) => const NotificationScreen(),
                        transitionsBuilder:
                            (_, Animation<double> animation, __, Widget child) {
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
                  },
                  child: SvgPicture.asset(
                    'assets/images/ic_notification.svg',
                  ),
                ),
                Gap(AppLayout.getWidth(40)),
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(child: CustomButtonDark(title: 'Buy')),
                          Gap(AppLayout.getWidth(10)),
                          Expanded(child: CustomButtonLight(title: 'Rent')),
                          Gap(AppLayout.getWidth(10)),
                          Expanded(
                              child: Container(
                            height: AppLayout.getHeight(45),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: AppLayout.getWidth(15)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: ColorStyles.primaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Filters',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Outfit",
                                    fontWeight: FontWeight.w500,
                                    color: ColorStyles.textColorDark,
                                  ),
                                ),
                                Gap(AppLayout.getWidth(8)),
                                SvgPicture.asset('assets/images/ic_filter.svg')
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                    Gap(AppLayout.getHeight(15)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Sold',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w600,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Outfit",
                                  fontWeight: FontWeight.w500,
                                  color: ColorStyles.textColorDark,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(AppLayout.getHeight(10)),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      color: ColorStyles.primaryColor,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: controller.popularCourseList
                              .map((popularCourse) =>
                                  ChangeNotifierProvider<RecentSoldNotifier>(
                                    create: (context) =>
                                        RecentSoldNotifier(pc: popularCourse),
                                    child: const RecentSoldContainer(),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    Gap(AppLayout.getHeight(25)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'New',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w600,
                              color: ColorStyles.textColorDark,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Outfit",
                                  fontWeight: FontWeight.w500,
                                  color: ColorStyles.textColorDark,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(AppLayout.getHeight(10)),
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
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.01),
                        Colors.white70,
                        Colors.white,
                      ],
                      stops: [0.0, 0.4, 0.8],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: AppLayout.getWidth(20),
                        right: AppLayout.getWidth(20),
                        bottom: AppLayout.getHeight(20)),
                    child: InkWell(
                      onTap: () async {
                        await SheetData.modalBottomSheetMenu(context);
                      },
                      child: const CustomButtonDark(title: 'Ask for Guide'),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
