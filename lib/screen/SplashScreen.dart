import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate/screen/OnBordingScreen.dart';

import '../utils/ColorUtils.dart';
import '../utils/Constant.dart';
import '../utils/app_pref.dart';
import 'login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);

    Future.delayed(const Duration(seconds: 3), () async{
      await AppPref.loadSharedPref("firstTime", true).then((value){
        if(value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnBoardingScreen(),
            ),
          );
        }else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LogInScreen(),
            ),
          );
        }
      });
    });

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // SvgPicture.asset('assets/images/logo.svg',
                //     width: 110, height: 110),
                Text(Constant.appName,
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: "Outfit",
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.getPrimaryText(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
