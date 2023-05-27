import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/dialog/book_tour_bottom_sheet.dart';

import '../dialog/contact_agent_bottom_sheet.dart';
import '../model/NeighborhoodItem.dart';
import '../model/post_model.dart';
import '../notifier/home_change_notifier.dart';
import '../notifier/recent_sold_notifier.dart';
import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../widget/button/CustomButtonDark.dart';
import '../widget/button/CustomButtonGray.dart';
import '../widget/image_container.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Post videoDetails;

  const ProductDetailsScreen({Key? key, required this.videoDetails})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<String> titleList = [
    '2400 sqft',
    '5 Beds',
    '4 Baths',
    '2 Car Garage',
    '7 Car Parking',
    'Heating & Cooling',
  ];
  List<String> interiorList = [
    'Bed:',
    'Bath:',
    'Kitchen:',
    'Living area:',
    'A/C:',
    'Flooring:',
    'Utilities:',
    'Appliances:',
    'Electricity:',
    'Gas:',
    'Fireplace:',
    'Spa:',
    'Stories:',
    'Levels:',
    'Entrance:',
    'View:',
    'Gas:',
    'Fireplace:',
    'Spa:',
  ];
  List<String> iconList = [
    'assets/images/ic_bed.svg',
    'assets/images/ic_bath.svg',
    'assets/images/ic_car.svg',
    'assets/images/ic_car.svg',
  ];

  List<NeighborhoodItem> neighborhoodList = [
    NeighborhoodItem(
      icon: 'assets/images/ic_walk.svg',
      title: 'There are\nsidewalks',
      percent: 0.86,
      color: ColorStyles.neighborhood1,
    ),
    NeighborhoodItem(
      icon: 'assets/images/ic_cart.svg',
      title: 'Walkable to\ngrocery store',
      percent: 0.81,
      color: ColorStyles.neighborhood2,
    ),
    NeighborhoodItem(
      icon: 'assets/images/ic_walk.svg',
      title: 'It’s Pet\nFriendly',
      percent: 0.97,
      color: ColorStyles.neighborhood3,
    ),
    NeighborhoodItem(
      icon: 'assets/images/ic_street.svg',
      title: 'Streets are\nwell lit',
      percent: 0.73,
      color: ColorStyles.neighborhood4,
    ),
    NeighborhoodItem(
      icon: 'assets/images/ic_neighbor.svg',
      title: 'Neighbors are\nFriendly',
      percent: 0.60,
      color: ColorStyles.neighborhood5,
    ),
    NeighborhoodItem(
      icon: 'assets/images/ic_friendly.svg',
      title: 'Neighbors are\nFriendly',
      percent: 0.70,
      color: ColorStyles.neighborhood6,
    ),
    NeighborhoodItem(
      icon: 'assets/images/ic_resturant.svg',
      title: 'Walkable to\nrestaurants',
      percent: 0.34,
      color: ColorStyles.neighborhood7,
    ),
  ];

  String fullName = "James Smith Don";
  int firstSpaceIndex=0;

  var imageUrl =
  "https://guardian.ng/wp-content/uploads/2020/06/real-estate.jpg";

  List<bool> priceExpandList = List.generate(2, (index) => false);

  @override
  void initState() {
    super.initState();

    firstSpaceIndex = fullName.indexOf(" ");
    if (firstSpaceIndex != -1) {
      fullName =
          fullName.replaceRange(firstSpaceIndex, firstSpaceIndex + 1, "\n");
    }
  }
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeChangeNotifier>(context);

    return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: ColorStyles.primaryColor,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: ColorStyles.primaryColor,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            flexibleSpace: Align(
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: AppLayout.getWidth(15)),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child:
                          SvgPicture.asset('assets/images/ic_arrow_back.svg'),
                    ),
                  ),
                  const Spacer(),
                  Gap(AppLayout.getWidth(15)),
                  SvgPicture.asset(
                    'assets/images/ic_timer.svg',
                  ),
                  Gap(AppLayout.getWidth(10)),
                  Text(
                    'March 19,2023',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.2,
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.w400,
                      color: ColorStyles.textColorDark,
                    ),
                  ),
                  Gap(AppLayout.getWidth(15)),
                  InkWell(
                    onTap: () async {},
                    child: SvgPicture.asset(
                      'assets/images/ic_fav.svg',
                    ),
                  ),
                  Gap(AppLayout.getWidth(15)),
                  InkWell(
                    onTap: () async {},
                    child: SvgPicture.asset(
                      'assets/images/ic_share.svg',
                    ),
                  ),
                  Gap(AppLayout.getWidth(15)),
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
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
                    Gap(AppLayout.getHeight(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: (AppLayout.getScreenWidth() / 3.7) * .75,
                          width: AppLayout.getScreenWidth() / 3.7,
                          margin: EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: ColorStyles.cardBg,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(imageUrl),
                            ),
                          ),
                        ),
                        Container(
                          height: (AppLayout.getScreenWidth() / 3.7) * .75,
                          width: AppLayout.getScreenWidth() / 3.7,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: ColorStyles.cardBg,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(imageUrl),
                            ),
                          ),
                        ),
                        Container(
                          height: (AppLayout.getScreenWidth() / 3.7) * .75,
                          width: AppLayout.getScreenWidth() / 3.7,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
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
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ColorStyles.cardBg,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(imageUrl),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: ClipRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 3.7, sigmaY: 3.7),
                                        child: Container(
                                          color: Colors.transparent,
                                        ),
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
                                      fontSize: 18,
                                      height: .85,
                                      fontFamily: "Outfit",
                                      fontWeight: FontWeight.w500,
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
                          horizontal: AppLayout.getWidth(20.0),
                          vertical: AppLayout.getHeight(20)),
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
                                '${widget.videoDetails.totalViews.toString()}000',
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
                          ExpandableText(
                            widget.videoDetails.videoDescription,
                            readMoreText: 'See More',
                            readLessText: 'See Less',
                            trim: 4,
                            onLinkPressed: (expanded) {},
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.275,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w300,
                              color: ColorStyles.textDescriptionColor,
                            ),
                            linkTextStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: "Outfit",
                              fontWeight:
                                  FontWeight.w500, // customizing link font size
                              color: ColorStyles
                                  .textColorGrey, // customizing link color
                            ),
                          ),
                          Gap(AppLayout.getWidth(15)),
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
                          Gap(AppLayout.getWidth(8)),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: AppLayout.getScreenWidth(),
                      color: ColorStyles.lineColor,
                      margin: EdgeInsets.symmetric(
                          vertical: AppLayout.getHeight(12)),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Highlights',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.35,
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.bold,
                          color: ColorStyles.textColorDark,
                        ),
                      ),
                    ),
                    Container(
                        width: AppLayout.getScreenWidth(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: const Color(0xFFF5F5F5),
                        ),
                        margin: EdgeInsets.symmetric(
                            vertical: AppLayout.getHeight(12),
                            horizontal: AppLayout.getWidth(20)),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppLayout.getWidth(20.0),
                            vertical: AppLayout.getHeight(15)),
                        child: Column(
                          children: List.generate(titleList.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    margin: EdgeInsets.only(
                                        right: AppLayout.getWidth(8)),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: ColorStyles.textColorGrey,
                                    ),
                                  ),
                                  Text(
                                    titleList[index],
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1,
                                      fontFamily: "Outfit",
                                      fontWeight: FontWeight.w400,
                                      color: ColorStyles.textColorGrey,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        )),
                    Column(
                      children: List.generate(4, (index) {
                        return Column(
                          children: [
                            Container(
                              height: 1,
                              width: AppLayout.getScreenWidth(),
                              color: ColorStyles.lineColor,
                              margin: EdgeInsets.symmetric(
                                  vertical: AppLayout.getHeight(12)),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppLayout.getWidth(20.0),
                                  vertical: AppLayout.getHeight(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                      iconList[index],
                                      height: 19,
                                      width: 35,
                                    ),
                                  ),
                                  Gap(AppLayout.getWidth(4)),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      titleList[index + 1],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18,
                                        height: 1.35,
                                        fontFamily: "Outfit",
                                        fontWeight: FontWeight.bold,
                                        color: ColorStyles.textColorDark,
                                      ),
                                    ),
                                  ),
                                  Gap(AppLayout.getWidth(8)),
                                  Container(
                                    height: AppLayout.getScreenWidth() * .65,
                                    width: AppLayout.getScreenWidth(),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: ColorStyles.cardBg,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(imageUrl),
                                      ),
                                    ),
                                  ),
                                  Gap(AppLayout.getHeight(5)),
                                  Container(
                                    color: ColorStyles.primaryColor,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: controller.popularCourseList
                                            .map((popularCourse) =>
                                                ChangeNotifierProvider<
                                                    RecentSoldNotifier>(
                                                  create: (context) =>
                                                      RecentSoldNotifier(
                                                          pc: popularCourse),
                                                  child: const ImageContainer(),
                                                ))
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                  Gap(AppLayout.getHeight(15)),
                                  Text(
                                    'Description',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      height: 1.27,
                                      fontFamily: "Outfit",
                                      fontWeight: FontWeight.w500,
                                      color: ColorStyles.textColorGrey,
                                    ),
                                  ),
                                  Gap(AppLayout.getWidth(8)),
                                  ExpandableText(
                                    widget.videoDetails.videoDescription,
                                    readMoreText: 'See More',
                                    readLessText: 'See Less',
                                    trim: 4,
                                    onLinkPressed: (expanded) {},
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1.275,
                                      fontFamily: "Outfit",
                                      fontWeight: FontWeight.w300,
                                      color: ColorStyles.textDescriptionColor,
                                    ),
                                    linkTextStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Outfit",
                                      fontWeight: FontWeight.w500,
                                      // customizing link font size
                                      color: ColorStyles
                                          .textColorGrey, // customizing link color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                    Container(
                      height: 1,
                      width: AppLayout.getScreenWidth(),
                      color: ColorStyles.lineColor,
                      margin: EdgeInsets.symmetric(
                          vertical: AppLayout.getHeight(12)),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'More Details',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.35,
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.bold,
                          color: ColorStyles.textColorDark,
                        ),
                      ),
                    ),
                    Container(
                        width: AppLayout.getScreenWidth(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: const Color(0xFFF5F5F5),
                        ),
                        margin: EdgeInsets.symmetric(
                            vertical: AppLayout.getHeight(12),
                            horizontal: AppLayout.getWidth(20)),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppLayout.getWidth(20.0),
                            vertical: AppLayout.getHeight(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Interior',
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.35,
                                  fontFamily: "Outfit",
                                  fontWeight: FontWeight.bold,
                                  color: ColorStyles.textColorDark,
                                ),
                              ),
                              ...List.generate(interiorList.length, (index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        interiorList[index],
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          height: 1,
                                          fontFamily: "Outfit",
                                          fontWeight: FontWeight.bold,
                                          color: ColorStyles.textColorLightE,
                                        ),
                                      ),
                                      Text(
                                        ' 5',
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          height: 1,
                                          fontFamily: "Outfit",
                                          fontWeight: FontWeight.w300,
                                          color: ColorStyles.textColorGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ])),
                    Container(
                      height: 1,
                      width: AppLayout.getScreenWidth(),
                      color: ColorStyles.lineColor,
                      margin: EdgeInsets.symmetric(
                          vertical: AppLayout.getHeight(12)),
                    ),
                    Gap(AppLayout.getHeight(10)),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Price History',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.35,
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.bold,
                          color: ColorStyles.textColorDark,
                        ),
                      ),
                    ),
                    Gap(AppLayout.getHeight(10)),
                    ...List.generate(2, (index){
                      return Container(
                          width: AppLayout.getScreenWidth(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: const Color(0xFFF5F5F5),
                          ),
                          margin: EdgeInsets.symmetric(
                              vertical: AppLayout.getHeight(5),
                              horizontal: AppLayout.getWidth(20)),
                          padding: EdgeInsets.symmetric(
                              horizontal: AppLayout.getWidth(20.0),
                              vertical: AppLayout.getHeight(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${widget.videoDetails.totalViews}000',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: .85,
                                      fontFamily: "Outfit",
                                      fontWeight: FontWeight.w600,
                                      color: ColorStyles.textColorGrey,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '21-03-2023',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 14,
                                        height: .85,
                                        fontFamily: "Outfit",
                                        fontWeight: FontWeight.w600,
                                        color: ColorStyles.textColorGrey,
                                      ),
                                    ),
                                  ),
                                  Gap(!priceExpandList[index]? AppLayout.getWidth(30):0),
                                  Visibility(
                                    visible: !priceExpandList[index],
                                    child: InkWell(
                                      onTap: (){
                                        setState(() {
                                          priceExpandList[index] = !priceExpandList[index];
                                        });
                                      },
                                      child: SvgPicture.asset(
                                          'assets/images/ic_down_arrow.svg'),
                                    ),
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: priceExpandList[index],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Gap(AppLayout.getHeight(30)),
                                    Text(
                                      'Listing Type',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 14,
                                        height: 1.36,
                                        fontFamily: "Outfit",
                                        fontWeight: FontWeight.w600,
                                        color: ColorStyles.textColorGrey,
                                      ),
                                    ),
                                    Text(
                                      'Price Change',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 14,
                                        height: 1.36,
                                        fontFamily: "Outfit",
                                        fontWeight: FontWeight.w300,
                                        color: ColorStyles.textColorGrey,
                                      ),
                                    ),
                                    Gap(AppLayout.getHeight(15)),
                                    Text(
                                      'Source',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 14,
                                        height: 1.36,
                                        fontFamily: "Outfit",
                                        fontWeight: FontWeight.w600,
                                        color: ColorStyles.textColorGrey,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'bridgeMLS/CCAR/Bay\nEast AOR #41022160',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 14,
                                            height: 1.36,
                                            fontFamily: "Outfit",
                                            fontWeight: FontWeight.w300,
                                            color: ColorStyles.textColorGrey,
                                          ),
                                        ),
                                        Transform.rotate(
                                          angle: 3.14,
                                          child: InkWell(
                                            onTap: (){
                                              setState(() {
                                                priceExpandList[index] = !priceExpandList[index];
                                              });
                                            },
                                            child: SvgPicture.asset(
                                                'assets/images/ic_down_arrow.svg'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ));
                    }),
                    Container(
                      height: 1,
                      width: AppLayout.getScreenWidth(),
                      color: ColorStyles.lineColor,
                      margin: EdgeInsets.symmetric(
                          vertical: AppLayout.getHeight(12)),
                    ),
                    Gap(AppLayout.getHeight(10)),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Neighborhood\noverview',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.35,
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.bold,
                          color: ColorStyles.textColorDark,
                        ),
                      ),
                    ),
                    Container(
                        width: AppLayout.getScreenWidth(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: const Color(0xFFF5F5F5),
                        ),
                        margin: EdgeInsets.symmetric(
                            vertical: AppLayout.getHeight(25),
                            horizontal: AppLayout.getWidth(20)),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppLayout.getWidth(20.0),
                            vertical: AppLayout.getHeight(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(neighborhoodList.length, (index){
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(neighborhoodList[index].icon),
                                  Gap(AppLayout.getWidth(10)),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              neighborhoodList[index].title,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: 16,
                                                height: 1.15,
                                                fontFamily: "Outfit",
                                                fontWeight: FontWeight.bold,
                                                color: ColorStyles.textColorGrey,
                                              ),
                                            ),
                                            Text(
                                              (neighborhoodList[index].percent*100).toString(),
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                fontSize: 22,
                                                height: 1.15,
                                                fontFamily: "Outfit",
                                                fontWeight: FontWeight.bold,
                                                color: neighborhoodList[index].color,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Gap(AppLayout.getHeight(10)),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(4),
                                          child: LinearProgressIndicator(
                                            value: neighborhoodList[index].percent,
                                            minHeight: 13,
                                            backgroundColor: ColorStyles.textColorLightGrey,
                                            valueColor: AlwaysStoppedAnimation<Color>(
                                              neighborhoodList[index].color,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                        )),
                    Container(
                      height: 1,
                      width: AppLayout.getScreenWidth(),
                      color: ColorStyles.lineColor,
                      margin: EdgeInsets.symmetric(
                          vertical: AppLayout.getHeight(12)),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Listed By',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.35,
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.bold,
                          color: ColorStyles.textColorDark,
                        ),
                      ),
                    ),
                    Container(
                        width: AppLayout.getScreenWidth(),
                        color: Colors.transparent,
                        margin: EdgeInsets.symmetric(
                            vertical: AppLayout.getHeight(12),
                            horizontal: AppLayout.getWidth(20)),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppLayout.getWidth(20.0),
                            vertical: AppLayout.getHeight(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height:
                                        (AppLayout.getScreenWidth() / 4) * 1.3,
                                    width: AppLayout.getScreenWidth() / 4,
                                    margin: EdgeInsets.only(right: 25),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: ColorStyles.cardBg,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(imageUrl),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        fullName,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 30,
                                          height: 1.17,
                                          fontFamily: "Outfit",
                                          fontWeight: FontWeight.w400,
                                          color: ColorStyles.textColorDark,
                                        ),
                                      ),
                                      Text(
                                        'The Real Estate LTD.',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 16,
                                          height: 1.35,
                                          fontFamily: "Outfit",
                                          fontWeight: FontWeight.w300,
                                          color: ColorStyles.textColorGrey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Gap(AppLayout.getHeight(30)),
                              Text(
                                'Contact with\n${fullName.substring(0, firstSpaceIndex)}',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.15,
                                  fontFamily: "Outfit",
                                  fontWeight: FontWeight.bold,
                                  color: ColorStyles.textColorGrey,
                                ),
                              ),
                              Gap(AppLayout.getHeight(10)),
                              Text(
                                '(555) 123-4567',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.05,
                                  fontFamily: "Outfit",
                                  fontWeight: FontWeight.w400,
                                  color: ColorStyles.textColorGrey,
                                ),
                              ),
                              Gap(AppLayout.getHeight(2)),
                              Text(
                                '(555) 123-4568',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.05,
                                  fontFamily: "Outfit",
                                  fontWeight: FontWeight.w400,
                                  color: ColorStyles.textColorGrey,
                                ),
                              ),
                              Gap(AppLayout.getHeight(5)),
                              Text(
                                'jamessmith@gamil.com',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.05,
                                  fontFamily: "Outfit",
                                  fontWeight: FontWeight.w400,
                                  color: ColorStyles.textColorGrey,
                                ),
                              ),
                            ])),
                    Container(
                        width: AppLayout.getScreenWidth(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: const Color(0xFFF5F5F5),
                        ),
                        margin: EdgeInsets.symmetric(
                            vertical: AppLayout.getHeight(12),
                            horizontal: AppLayout.getWidth(20)),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppLayout.getWidth(20.0),
                            vertical: AppLayout.getHeight(15)),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child:
                                  SvgPicture.asset('assets/images/ic_info.svg'),
                            ),
                            Text(
                              'It has come to our attention that some individuals may be posing as "contact agents" in order to obtain sensitive information or engage in fraudulent activity. These individuals may claim to represent reputable organizations or businesses, but in reality they are only seeking to exploit unsuspecting individuals.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.55,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w200,
                                color: ColorStyles.textColorGrey,
                              ),
                            ),
                          ],
                        )),
                    Gap(AppLayout.getHeight(70))
                  ],
                ),
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
                          Colors.white70,
                          Colors.white,
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
                              await BookTourDialog.modalBottomSheetMenu(
                                  context);
                            },
                            child: const CustomButtonGray(title: 'Book a Tour'),
                          ),
                        ),
                        Gap(AppLayout.getWidth(20)),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              await ContactAgentBottomSheet.modalBottomSheetMenu(
                                  context);
                            },
                            child:
                                const CustomButtonDark(title: 'Contact Agent'),
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
