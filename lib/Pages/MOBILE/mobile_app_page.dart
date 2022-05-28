import 'package:app_support_website/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MobileAppPage extends StatefulWidget {
  const MobileAppPage({Key? key}) : super(key: key);

  @override
  _MobileAppPageState createState() => _MobileAppPageState();
}

class _MobileAppPageState extends State<MobileAppPage> {
  final ScrollController scrollController = ScrollController();

  final controller = CarouselController();
  int activeIndex = 0;
  final img_trans = [
    'assets/app/other_game/trans.png',
    'assets/app/other_game/trans1.png',
    'assets/app/other_game/trans2.png',
  ];

  final controller2 = CarouselController();
  int activeIndex2 = 0;
  final img_pass = [
    'assets/app/other_game/pass.png',
    'assets/app/other_game/pass2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: buildAppBar("アプリ"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),

                buildAppURLButton(
                    image: "assets/app/apps_icon/translation.png",
                    appName: "翻訳アプリ\n(プレイストア)",
                    onClick: translateAndroidURL,
                    ios: false,
                    apple: false,
                    mobile: true,
                    textColor: Colors.white),

                const SizedBox(
                  height: 40,
                ),

                //画�?
                Stack(
                  children: [
                    CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: img_trans.length,
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayCurve: Curves.easeInExpo,
                          aspectRatio: 2,
                          autoPlayAnimationDuration: const Duration(seconds: 2),
                          height: 270,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          reverse: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex = index;
                            });
                          }),
                      itemBuilder: (ctx, index, realIndex) {
                        final transImg = img_trans[index];
                        return buildImage(transImg);
                      },
                    ),
                  ],
                ),

                const SizedBox(
                  height: 200,
                ),

                buildAppURLButton(
                    image: "assets/app/apps_icon/memo_logo.png",
                    appName: "シンプルなメモ帳\n(プレイストア)",
                    onClick: memoAndroidURL,
                    ios: false,
                    apple: false,
                    mobile: true,
                    textColor: Colors.white),
                const SizedBox(
                  height: 40,
                ),

                SizedBox(
                    height: 270,
                    child: Image.asset(
                        height: 400, "assets/app/other_game/memo.png")),

                const SizedBox(
                  height: 200,
                ),

                buildAppURLButton(
                    image: "assets/app/apps_icon/ps_logo.png",
                    appName: "パスワード管理アプリ\n(プレイストア)",
                    onClick: psportAndroidURL,
                    ios: false,
                    apple: false,
                    mobile: true,
                    textColor: Colors.white),

                const SizedBox(
                  height: 40,
                ),

                //画�?
                Stack(
                  children: [
                    CarouselSlider.builder(
                      carouselController: controller2,
                      itemCount: img_pass.length,
                      options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2,
                          autoPlayCurve: Curves.easeInExpo,
                          autoPlayAnimationDuration: const Duration(seconds: 2),
                          height: 270,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          reverse: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex2 = index;
                            });
                          }),
                      itemBuilder: (ctx, index, realIndex) {
                        final passImg = img_pass[index];
                        return buildImage(passImg);
                      },
                    ),
                  ],
                ),

                const SizedBox(
                  height: 200,
                ),

                //Ok Google kun android
                buildAppURLButton(
                    image: "assets/app/apps_icon/ai_g_logo.png",
                    appName: "OK グーグル君\n(プレイストア)",
                    onClick: okGoogleAndroidURL,
                    ios: false,
                    apple: false,
                    mobile: true,
                    textColor: Colors.white),

                const SizedBox(
                  height: 40,
                ),

                //Ok Google kun android English
                buildAppURLButton(
                    image: "assets/app/apps_icon/ai_g_logo.png",
                    appName: "OK グーグル君\n-英語版-",
                    onClick: okGoogleEnglishAndroidURL,
                    ios: false,
                    apple: false,
                    mobile: true,
                    textColor: Colors.white),

                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
