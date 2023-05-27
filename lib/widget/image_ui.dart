import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_layout.dart';

class ImageUi {
  static Widget groupPhoto(url, imageBoarderColor,imageSize) {
    return SizedBox(
      width: imageSize,
      height: imageSize,
      child: CircleAvatar(
        backgroundColor: imageBoarderColor,
        minRadius: 500.0,
        child: Container(
          padding: EdgeInsets.all(AppLayout.getHeight(0)),
          child: SvgPicture.asset(url,),
          // child: Image.asset(
          //   url,
          //   fit: BoxFit.cover,
          //   height: AppLayout.getHeight(185),
          //   width: AppLayout.getHeight(185),
          // ),
        ),
      ),
    );
  }
}
