import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_layout.dart';
import 'image_ui.dart';

class ImageWidget {
  static Widget imageWidget(url, imageBoarderColor,imgSize) {
    bool isBase64Encoded(String encodedImage) {
      try {
        base64Decode(encodedImage);
        return true;
      } catch (error) {
        return false;
      }
    }

    bool isEncoded = isBase64Encoded(url);

    return
      !isEncoded
        ?
    SizedBox(
            width: imgSize,
            height: imgSize,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: url,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundColor: Colors.transparent,
                minRadius: 500.0,
                child: Container(
                  width: imgSize,
                  height: imgSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image:
                        DecorationImage(image: imageProvider, fit: BoxFit.fill),
                  ),
                ),
              ),
              placeholder: (context, url) => ImageUi.groupPhoto(
                  "assets/images/image_picker.svg", imageBoarderColor,imgSize),
              errorWidget: (context, url, error) => ImageUi.groupPhoto(
                  "assets/images/image_picker.svg", imageBoarderColor,imgSize),
            ),
          )
        : SizedBox(
            width: imgSize,
            height: imgSize,
            child: CircleAvatar(
              backgroundColor: imageBoarderColor,
              minRadius: 500.0,
              child: Container(
                padding: EdgeInsets.all(AppLayout.getHeight(40)),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: MemoryImage(base64Decode(url)),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          );
  }
}
