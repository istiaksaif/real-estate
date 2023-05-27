import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:real_estate/screen/qna_screen.dart';

import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../widget/button/CustomButtonDark.dart';
import '../widget/button/CustomButtonLight.dart';
import '../widget/profileimageupdate.dart';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({Key? key}) : super(key: key);

  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  bool imageExits = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.backGroundColor,
      body:Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
              child: SizedBox(
                height: AppLayout.getScreenHeight(),
                width: AppLayout.getScreenWidth(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: ProfileImageUpdate('assets/images/image_picker.svg', 'userId',(value){
                        setState(() {
                          imageExits = value;
                        });
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: ColorStyles.backGroundColor,
        child: Padding(
          padding:
          EdgeInsets.only(left: AppLayout.getWidth(25),right: AppLayout.getWidth(25),bottom: AppLayout.getHeight(80)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const QNAScreen()));
                  },
                  child: const CustomButtonLight(title: 'Skip Now'),
                ),
              ),
              Gap(AppLayout.getWidth(25)),
              Expanded(
                child: InkWell(
                  onTap: () {
                    imageExits ?
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const QNAScreen())):Fluttertoast.showToast(
                      msg: "image unavailable!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: ColorStyles.primaryColor,
                      fontSize: 12.0,
                    );
                  },
                  child: const CustomButtonDark(title: 'Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
