import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as IMG;

import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import 'button/CustomButtonLight.dart';
import 'image_widget.dart';

class ProfileImageUpdate extends StatefulWidget {
  final String imageURL;
  final String docId;
  final Function onClick;

  const ProfileImageUpdate(
    this.imageURL,
    this.docId, this.onClick,
  );

  @override
  _StudentImageState createState() => _StudentImageState();
}

class _StudentImageState extends State<ProfileImageUpdate> {
  var pickedImage;
  var delUrl;

  pickImage(ImageSource imageType) async {
    final ImagePicker _picker = ImagePicker();
    try {
      final photo = await _picker.pickImage(
        source: imageType,
      );
      if (photo == null) return;
      var tempImage = File(photo.path);

      final tempImage2 = await _cropImage(imageFile: tempImage);
      if (tempImage2 == null) {
        // Navigator.pop(context);
        return;
      }

      // Navigator.pop(context);
      IMG.Image? image =
          IMG.decodeImage(File(tempImage2.path).readAsBytesSync());
      IMG.Image thumbnail = IMG.copyResize(image!, width: 120, height: 120);

      tempImage.writeAsBytesSync(IMG.encodePng(thumbnail));

      Uint8List imageData = tempImage2.readAsBytesSync();
      String encodedImage = base64Encode(imageData);
      delUrl = encodedImage;
      widget.onClick(true);
      setState(() {});
    } catch (error) {
      // print(error);
    }
  }

  @override
  void initState() {
    delUrl = widget.imageURL;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageWidget.imageWidget(delUrl, ColorStyles.textColorLightGrey,AppLayout.getHeight(187)),
        Gap(AppLayout.getHeight(70)),
        InkWell(
          onTap: () {
            pickImage(ImageSource.gallery);
          },
          child: const CustomButtonLight(title: 'Choose Photo'),
        ),
      ],
    );
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        uiSettings: [androidUiSettingsLocked()],
        compressQuality: 100);

    if (croppedFile == null) {
      return null;
    }

    return File(croppedFile.path);
  }

  AndroidUiSettings androidUiSettingsLocked() => AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Color(0Xff112e30),
        backgroundColor: Color(0Xff112e30),
        toolbarWidgetColor: ColorStyles.colorLightGreen,
        lockAspectRatio: false,
        hideBottomControls: true,
      );
}

var globalContext;
