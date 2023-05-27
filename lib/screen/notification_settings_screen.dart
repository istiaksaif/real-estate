import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../notifier/NotificationChangeNotifier.dart';
import '../notifier/notification_items_change_notifier.dart';
import '../utils/ColorUtils.dart';
import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../widget/notification_card.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool _switchNotifySound = false, _switchVibrate = false;
  bool _switchListing = false, _switchTourAlert = false;

  Future<void> sharedPref(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, value);
  }

  Future<void> loadSharedPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _switchNotifySound = sharedPreferences.getBool("notification") ?? true;
    _switchVibrate = sharedPreferences.getBool("vibrate") ?? false;
    _switchListing = sharedPreferences.getBool("listing") ?? false;
    _switchTourAlert = sharedPreferences.getBool("tourAlert") ?? false;
  }

  @override
  void initState() {
    super.initState();
    loadSharedPref().then((value) {
      setState(() {});
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
                  'Notification Settings',
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
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20.0)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notification Sounds",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.w400,
                      color: ColorUtils.getPrimaryText(context),
                    ),
                  ),
                  Transform.scale(
                    scale: .9,
                    child: Switch(
                      value: _switchNotifySound,
                      onChanged: (value) {
                        setState(() {
                          _switchNotifySound = value;
                        });
                        sharedPref("notification", value);
                      },
                      activeColor: ColorStyles.thumb_tint_actvie,
                      inactiveThumbColor: ColorStyles.thumb_tint,
                      activeTrackColor: ColorStyles.track_tint_actvie,
                      inactiveTrackColor: ColorStyles.track_tint,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notification Vibrations",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.w400,
                      color: ColorUtils.getPrimaryText(context),
                    ),
                  ),
                  Transform.scale(
                    scale: .9,
                    child: Switch(
                      value: _switchVibrate,
                      onChanged: (value) {
                        setState(() {
                          _switchVibrate = value;
                        });
                        sharedPref("vibrate", value);
                      },
                      activeColor: ColorStyles.thumb_tint_actvie,
                      inactiveThumbColor: ColorStyles.thumb_tint,
                      activeTrackColor: ColorStyles.track_tint_actvie,
                      inactiveTrackColor: ColorStyles.track_tint,
                    ),
                  )
                ],
              ),
              Divider(
                color: ColorStyles.lineColor,
                thickness: 1.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Listing Notification",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.w400,
                      color: ColorUtils.getPrimaryText(context),
                    ),
                  ),
                  Transform.scale(
                    scale: .9,
                    child: Switch(
                      value: _switchListing,
                      onChanged: (value) {
                        setState(() {
                          _switchListing = value;
                        });
                        sharedPref("listing", value);
                      },
                      activeColor: ColorStyles.thumb_tint_actvie,
                      inactiveThumbColor: ColorStyles.thumb_tint,
                      activeTrackColor: ColorStyles.track_tint_actvie,
                      inactiveTrackColor: ColorStyles.track_tint,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tour Confirmation Alert",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.w400,
                      color: ColorUtils.getPrimaryText(context),
                    ),
                  ),
                  Transform.scale(
                    scale: .9,
                    child: Switch(
                      value: _switchTourAlert,
                      onChanged: (value) {
                        setState(() {
                          _switchTourAlert = value;
                        });
                        sharedPref("tourAlert", value);
                      },
                      activeColor: ColorStyles.thumb_tint_actvie,
                      inactiveThumbColor: ColorStyles.thumb_tint,
                      activeTrackColor: ColorStyles.track_tint_actvie,
                      inactiveTrackColor: ColorStyles.track_tint,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
