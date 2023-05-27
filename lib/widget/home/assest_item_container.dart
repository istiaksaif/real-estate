import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/screen/product_details_screen.dart';
import '../../notifier/recent_sold_notifier.dart';
import '../../utils/ColorUtils.dart';
import '../../utils/app_layout.dart';
import '../../utils/app_style.dart';
import '../image_widget.dart';

class AssetsItemContainer extends StatelessWidget {
  const AssetsItemContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageUrl =
        "https://guardian.ng/wp-content/uploads/2020/06/real-estate.jpg";
    return Consumer<RecentSoldNotifier>(builder: (context, courseModel, child) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                videoDetails: courseModel.popularCourse,
              ), //categoryName: recentVideo.categoryName
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppLayout.getHeight(13),
            ),
            color: ColorStyles.primaryColor,
          ),
          width: AppLayout.getScreenWidth(),
          margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7)),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getWidth(15.0),
                    vertical: AppLayout.getHeight(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: ImageWidget.imageWidget(
                        "https://marketplace.canva.com/EAFEits4-uw/1/0/800w/canva-boy-cartoon-gamer-animated-twitch-profile-photo-r0bPCSjUqg0.jpg",
                        ColorUtils.getBackGround(context),
                        AppLayout.getHeight(26),
                      ),
                    ),
                    Gap(AppLayout.getWidth(20)),
                    Text(
                      'James Smith',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1,
                        fontFamily: "Outfit",
                        fontWeight: FontWeight.bold,
                        color: ColorStyles.textColorDark,
                      ),
                    ),
                    Gap(AppLayout.getWidth(13)),
                    Container(
                      height: 5,
                      width: 5,
                      padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.getWidth(5)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: ColorStyles.textColorLight,
                      ),
                    ),
                    Gap(AppLayout.getWidth(8)),
                    Text(
                      '2 days ago',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1,
                        fontFamily: "Outfit",
                        fontWeight: FontWeight.w400,
                        color: ColorStyles.textColorLight,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/images/ic_fav.svg',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: AppLayout.getScreenWidth() * .6,
                width: AppLayout.getScreenWidth(),
                decoration: BoxDecoration(
                  color: ColorStyles.cardBg,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl),
                  ),
                ),
              ),
              Gap(AppLayout.getHeight(4)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: (AppLayout.getScreenWidth()/3.7)*.75,
                    width: AppLayout.getScreenWidth()/3.7,
                    margin: EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: ColorStyles.cardBg,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl),
                      ),
                    ),
                  ),
                  Container(
                    height: (AppLayout.getScreenWidth()/3.7)*.75,
                    width: AppLayout.getScreenWidth()/3.7,
                    margin: EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: ColorStyles.cardBg,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl),
                      ),
                    ),
                  ),
                  Container(
                    height: (AppLayout.getScreenWidth()/3.7)*.75,
                    width: AppLayout.getScreenWidth()/3.7,
                    margin: EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: ColorStyles.cardBg,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: (AppLayout.getScreenWidth() / 3.7) * 0.75,
                      width: AppLayout.getScreenWidth() / 7,
                      decoration: BoxDecoration(
                        color: ColorStyles.cardBg,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(imageUrl),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 3.7, sigmaY: 3.7), // Adjust the sigma values for desired blur strength
                                child: Container(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '+\n45',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.05,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w400,
                                color: ColorStyles.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Gap(AppLayout.getHeight(3)),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getWidth(15.0),
                    vertical: AppLayout.getHeight(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          '\$',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            height: 1.17,
                            fontFamily: "Outfit",
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFAC8600),
                          ),
                        ),
                        Text(
                          '${courseModel.popularCourse.totalViews.toString()}0000',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            height: 1.17,
                            fontFamily: "Outfit",
                            fontWeight: FontWeight.bold,
                            color: ColorStyles.textColorDark,
                          ),
                        ),
                      ],
                    ),
                    Gap(AppLayout.getWidth(8)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/ic_location.svg'),
                        Gap(AppLayout.getWidth(8)),
                        Text(
                          '511/2, West Kafrul, Agargaon Taltola, Dhaka',
                          maxLines: 1,
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
                    Container(
                      height: 1,
                      width: AppLayout.getScreenWidth(),
                      color: ColorStyles.lineColor,
                      margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(12)),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/ic_bed.svg',
                        ),
                        Gap(AppLayout.getWidth(15)),
                        Text(
                          '3 beds',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Outfit",
                            fontWeight: FontWeight.w300,
                            color: ColorStyles.textColorLight,
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          'assets/images/ic_bath.svg',
                        ),
                        Gap(AppLayout.getWidth(15)),
                        Text(
                          '2 baths',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Outfit",
                            fontWeight: FontWeight.w300,
                            color: ColorStyles.textColorLight,
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          'assets/images/ic_car.svg',
                        ),
                        Gap(AppLayout.getWidth(15)),
                        Text(
                          '3 cars',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Outfit",
                            fontWeight: FontWeight.w300,
                            color: ColorStyles.textColorLight,
                          ),
                        ),
                      ],
                    )
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
