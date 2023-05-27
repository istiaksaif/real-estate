import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:real_estate/screen/profile_screen.dart';
import 'package:real_estate/utils/app_layout.dart';
import '../utils/app_style.dart';
import '../widget/TooltipShape.dart';

class MoreDialog extends StatefulWidget {
  @override
  _MoreDialogState createState() => _MoreDialogState();

  static Future<void> modalBottomSheetMenu(BuildContext context) async {
    await showMenu(
      context: context,
      color: ColorStyles.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppLayout.getHeight(13)),
      ),
      position: const RelativeRect.fromLTRB(1, 0, 0, 1),
      items: [
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
              Navigator.push(context, PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 200),
                // Adjust the animation duration as desired
                pageBuilder: (_, __, ___) => const ProfileScreen(),
                transitionsBuilder: (_, Animation<double> animation, __,
                    Widget child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
              ),);
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
            },
          ),
        ),
      ],
      elevation: 0.0,
    );
  }
}

class _MoreDialogState extends State<MoreDialog> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
