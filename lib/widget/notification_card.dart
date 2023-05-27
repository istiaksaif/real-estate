import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_layout.dart';
import '../../../utils/app_style.dart';
import '../notifier/notification_items_change_notifier.dart';
import 'image_widget.dart';

class NotificationCard extends StatelessWidget {
  final int position;
  const NotificationCard({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotifyItemChangeNotifier>(
        builder: (context, courseModel, child) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {

        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getWidth(20.0),
                  vertical: AppLayout.getHeight(10.0)),
              width: AppLayout.getScreenWidth(),
              decoration: BoxDecoration(
                color: position==3 ? ColorStyles.notifyUnWatchBgColor:Colors.transparent,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageWidget.imageWidget(
                    "https://marketplace.canva.com/EAFEits4-uw/1/0/800w/canva-boy-cartoon-gamer-animated-twitch-profile-photo-r0bPCSjUqg0.jpg",
                    ColorStyles.backGroundColor,
                    AppLayout.getHeight(48),
                  ),
                  Gap(AppLayout.getHeight(10)),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                courseModel.notifyItem.videoTitle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.12,
                                  fontFamily: "Outfit",
                                  fontWeight: FontWeight.w600,
                                  color: ColorStyles.textColorDark,
                                ),
                              ),
                              Gap(AppLayout.getWidth(5)),
                              Text(
                                '1 day ago',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Outfit",
                                  fontWeight: FontWeight.w400,
                                  color: ColorStyles.textColorExtraLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(AppLayout.getWidth(10)),
                        SvgPicture.asset('assets/images/ic_cross.svg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: ColorStyles.lineColor,
            ),
          ],
        ),
      );
    });
  }
}
