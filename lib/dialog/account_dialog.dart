import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:real_estate/screen/profile_screen.dart';
import 'package:real_estate/utils/app_layout.dart';
import '../utils/app_style.dart';

class AccountDialog extends StatefulWidget {
  @override
  _AccountDialogState createState() => _AccountDialogState();

  static Future<void> modalBottomSheetMenu(BuildContext context) async {
    await showMenu(
      context: context,
      color: ColorStyles.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppLayout.getHeight(13)),
      ),
      position: const RelativeRect.fromLTRB(0, 90, 0, 0),
      items: [
        PopupMenuItem(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Row(
              children: [
                SvgPicture.asset('assets/images/ic_person.svg'),
                Gap(AppLayout.getWidth(15)),
                Text(
                  'Account Settings',
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
                SvgPicture.asset('assets/images/ic_logout.svg'),
                Gap(AppLayout.getWidth(15)),
                Text(
                  'Log Out',
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

class _AccountDialogState extends State<AccountDialog> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
