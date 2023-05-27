import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:real_estate/screen/image_upload_screen.dart';
import 'package:real_estate/widget/textFiled/CustomTextFiled.dart';

import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../widget/button/CustomButtonDark.dart';
import '../widget/button/CustomButtonLight.dart';
import 'qna_screen.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  TextEditingController _textFirstNameController = TextEditingController();
  TextEditingController _textLastNameController = TextEditingController();
  TextEditingController _textAddressController = TextEditingController();
  TextEditingController _textOccupationController = TextEditingController();
  FocusNode focusFirstName = FocusNode();
  FocusNode focusLastName = FocusNode();
  FocusNode focusAddress = FocusNode();
  FocusNode focusOccupation = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textFirstNameController.dispose();
    _textLastNameController.dispose();
    _textAddressController.dispose();
    _textOccupationController.dispose();
    focusFirstName.dispose();
    focusLastName.dispose();
    focusAddress.dispose();
    focusOccupation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.backGroundColor,
      body: SafeArea(
        child: Stack(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: AppLayout.getWidth(15)),
                        child: Text(
                          'Account\nInformation',
                          style: TextStyle(
                            fontSize: 35,
                            fontFamily: "Outfit",
                            fontWeight: FontWeight.w500,
                            color: ColorStyles.textColorGrey,
                          ),
                        ),
                      ),
                      Gap(AppLayout.getHeight(20)),
                      CustomTextField(
                          hintText: 'First Name',
                          controller: _textFirstNameController,
                          focusNode: focusFirstName,
                          onChanged: (value) {},
                          keyboardType: TextInputType.text),
                      Gap(AppLayout.getHeight(15)),
                      CustomTextField(
                          hintText: 'Last Name',
                          controller: _textLastNameController,
                          focusNode: focusLastName,
                          onChanged: (value) {},
                          keyboardType: TextInputType.text),
                      Gap(AppLayout.getHeight(15)),
                      CustomTextField(
                          hintText: 'Address',
                          controller: _textAddressController,
                          focusNode: focusAddress,
                          onChanged: (value) {},
                          keyboardType: TextInputType.text),
                      Gap(AppLayout.getHeight(15)),
                      CustomTextField(
                          hintText: 'Occupation',
                          controller: _textOccupationController,
                          focusNode: focusOccupation,
                          onChanged: (value) {},
                          keyboardType: TextInputType.text),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ImageUploadScreen()));
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

  void focusChange() {
    focusFirstName.unfocus();
    focusLastName.unfocus();
    focusAddress.unfocus();
    focusOccupation.unfocus();
  }
}
