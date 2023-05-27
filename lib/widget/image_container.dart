import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/notifier/recent_sold_notifier.dart';
import '../../utils/ColorUtils.dart';
import '../../utils/app_layout.dart';
import '../../utils/app_style.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({Key? key}) : super(key: key);

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
          height: (AppLayout.getScreenWidth()/3.15)*.75,
          width: AppLayout.getScreenWidth()/3.15,
          margin: EdgeInsets.only( right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: ColorStyles.cardBg,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
      );
    });
  }
}
