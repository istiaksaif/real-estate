import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/notifier/recent_sold_notifier.dart';
import '../../utils/ColorUtils.dart';
import '../../utils/app_layout.dart';
import '../../utils/app_style.dart';

class RecentSoldContainer extends StatelessWidget {
  const RecentSoldContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageUrl =
        "https://www.cityhomesllc.com/wp-content/uploads/2020/01/3369-Crystal-Bay-Road-Photo-For-Website-Gallery.jpg";
    return Consumer<RecentSoldNotifier>(
        builder: (context, courseModel, child) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {

        },
        child: Container(
          width: AppLayout.getWidth(150),
          margin: EdgeInsets.only(
              right: AppLayout.getWidth(10)),
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppLayout.getHeight(110),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppLayout.getHeight(13)),
                    topRight: Radius.circular(AppLayout.getHeight(13)),
                  ),
                  color: ColorStyles.cardBg,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl),
                  ),
                ),
              ),
              Container(
                height: AppLayout.getHeight(45),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppLayout.getHeight(13)),
                    bottomRight: Radius.circular(AppLayout.getHeight(13)),
                  ),
                  color: ColorStyles.cardBg,
                ),
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        courseModel.popularCourse.videoTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1,
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.w400,
                          color: ColorStyles.textColorDark,
                        ),
                      ),
                    ),
                    Gap(AppLayout.getWidth(7)),
                    Text(
                      '\$${courseModel.popularCourse.totalViews.toString()}m',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        height: .9,
                        fontFamily: "Outfit",
                        fontWeight: FontWeight.bold,
                        color: ColorStyles.textColorDark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
