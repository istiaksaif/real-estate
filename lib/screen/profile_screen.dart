import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../widget/CustomFiled.dart';
import '../widget/button/CustomButtonDark.dart';
import '../widget/button/CustomButtonLight.dart';
import '../widget/image_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _textNumber = TextEditingController();
  TextEditingController _textName = TextEditingController();
  TextEditingController _textLastName = TextEditingController();
  TextEditingController _textProfession = TextEditingController();
  TextEditingController _textGender = TextEditingController();
  TextEditingController _textEmail = TextEditingController();
  TextEditingController _textAddress = TextEditingController();
  FocusNode focusNode = FocusNode();
  FocusNode focusNodeLastName = FocusNode();
  FocusNode focusNodeProfession = FocusNode();
  FocusNode focusNodeGender = FocusNode();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodeAddress = FocusNode();

  bool editMode = false;

  @override
  void initState() {
    super.initState();
    _textNumber.text = '01787299836';
    _textName.text = 'James';
    _textLastName.text = 'Smith Don';
    _textProfession.text = 'Business';
    _textGender.text = 'Male';
    _textEmail.text = 'james.smith@gmail.com';
    _textAddress.text = '528/2, West Kafrul, Agargaon Taltola, Dhaka';
  }
  @override
  void dispose() {
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    AppLayout.systemHomeStatusColor(context);
    AppLayout.screenPortrait();
    return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: ColorStyles.backGroundColor,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: ColorStyles.primaryColor,
                    padding: EdgeInsets.all(AppLayout.getHeight(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageWidget.imageWidget(
                          "https://marketplace.canva.com/EAFEits4-uw/1/0/800w/canva-boy-cartoon-gamer-animated-twitch-profile-photo-r0bPCSjUqg0.jpg",
                          ColorStyles.backGroundColor,
                          AppLayout.getHeight(60),
                        ),
                        Gap(AppLayout.getWidth(15)),
                        Text(
                          'James Smith',
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: "Outfit",
                            fontWeight: FontWeight.bold,
                            color: ColorStyles.textColorDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          vertical: AppLayout.getWidth(10),
                          horizontal: AppLayout.getHeight(20)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'First Name:',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w500,
                                color: ColorStyles.textColorDark,
                              ),
                            ),
                            IgnorePointer(
                              ignoring: !editMode,
                              child: CustomFiled(
                                  hintText: 'first name',
                                  controller: _textName,
                                  focusNode: focusNode,
                                  onChanged: () {},
                                  keyboardType: TextInputType.text),
                            ),
                            Text(
                              'Last Name:',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w500,
                                color: ColorStyles.textColorDark,
                              ),
                            ),
                            IgnorePointer(
                              ignoring: !editMode,
                              child: CustomFiled(
                                  hintText: 'last name',
                                  controller: _textLastName,
                                  focusNode: focusNodeLastName,
                                  onChanged: () {},
                                  keyboardType: TextInputType.text),
                            ),
                            Text(
                              'Address:',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w500,
                                color: ColorStyles.textColorDark,
                              ),
                            ),
                            IgnorePointer(
                              ignoring: !editMode,
                              child: CustomFiled(
                                  hintText: 'address',
                                  controller: _textAddress,
                                  focusNode: focusNodeAddress,
                                  onChanged: () {},
                                  keyboardType: TextInputType.text),
                            ),
                            Text(
                              'Phone:',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w500,
                                color: ColorStyles.textColorDark,
                              ),
                            ),
                            Gap(AppLayout.getHeight(10)),
                            Container(
                              height: AppLayout.getHeight(50),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppLayout.getWidth(15)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorStyles.primaryColor,
                              ),
                              child: IgnorePointer(
                                ignoring: true,
                                child: IntlPhoneField(
                                  controller: _textNumber,
                                  decoration: InputDecoration(
                                    labelText: null,
                                    hintText: 'Phone',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: ColorStyles.textColorExtraLight,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Outfit",
                                    ),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorStyles.textColorDark,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Outfit",
                                  ),
                                  showDropdownIcon: false,
                                  disableLengthCheck: true,
                                  cursorColor: ColorStyles.indicateActiveColor,
                                  initialCountryCode: 'BD',
                                  invalidNumberMessage: null,
                                ),
                              ),
                            ),
                            Gap(AppLayout.getHeight(20)),
                            Text(
                              'E-mail:',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w500,
                                color: ColorStyles.textColorDark,
                              ),
                            ),
                            IgnorePointer(
                              ignoring: !editMode,
                              child: CustomFiled(
                                  hintText: 'e-mail',
                                  controller: _textEmail,
                                  focusNode: focusNodeEmail,
                                  onChanged: () {},
                                  keyboardType: TextInputType.text),
                            ),
                            Text(
                              'Gender:',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w500,
                                color: ColorStyles.textColorDark,
                              ),
                            ),
                            IgnorePointer(
                              ignoring: !editMode,
                              child: CustomFiled(
                                  hintText: 'male',
                                  controller: _textGender,
                                  focusNode: focusNodeGender,
                                  onChanged: () {},
                                  keyboardType: TextInputType.text),
                            ),
                            Text(
                              'Profession:',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w500,
                                color: ColorStyles.textColorDark,
                              ),
                            ),
                            IgnorePointer(
                              ignoring: !editMode,
                              child: CustomFiled(
                                  hintText: 'profession',
                                  controller: _textProfession,
                                  focusNode: focusNodeProfession,
                                  onChanged: () {},
                                  keyboardType: TextInputType.text),
                            ),
                            Gap(AppLayout.getHeight(70)),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.01),
                          Colors.transparent,
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.4, 0.8],
                      ),
                    ),
                    padding: EdgeInsets.only(
                        left: AppLayout.getWidth(20),
                        right: AppLayout.getWidth(20),
                        bottom: AppLayout.getHeight(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              Navigator.of(context).pop();
                            },
                            child: const CustomButtonLight(title: 'Back'),
                          ),
                        ),
                        Gap(AppLayout.getWidth(20)),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                editMode = !editMode;
                              });
                            },
                            child: editMode? const CustomButtonDark(title: 'Save'):const CustomButtonDark(title: 'Edit'),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
