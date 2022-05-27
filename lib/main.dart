import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_support_website/Pages/DESKTOP/desktop_home_page.dart';
import 'package:app_support_website/Pages/MOBILE/mobile_main_page.dart';
import 'package:app_support_website/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //向き指定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, //縦固定
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'アプリサポートウェブサイト',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(size: 30, color: Colors.white))),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () async {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ResponsiveLayout()),
          (_) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: DefaultTextStyle(
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 100,
                    fontFamily: "VujahdayScript"),
                child: AnimatedTextKit(
                  animatedTexts: [
                    ScaleAnimatedText('Welcome'),
                    ScaleAnimatedText('For'),
                    ScaleAnimatedText('Developer'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < desktopWidth) {
        return MobileMainPage();
      } else {
        return const DesktopHomePage();
      }
    }));
  }
}
