import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/notifier/NotificationChangeNotifier.dart';
import 'notifier/home_change_notifier.dart';
import 'screen/SplashScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeChangeNotifier()),
        ChangeNotifierProvider(create: (context) => NotificationChangeNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

