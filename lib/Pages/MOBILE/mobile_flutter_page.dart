import 'package:app_support_website/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MobileFlutterPage extends StatefulWidget {
  const MobileFlutterPage({Key? key}) : super(key: key);

  @override
  _MobileFlutterPageState createState() => _MobileFlutterPageState();
}

class _MobileFlutterPageState extends State<MobileFlutterPage> {
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
    'assets/app/other_game/pass3.png',
  ];

  @override
  Widget build(BuildContext context) {
    const appStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.red,
      fontFamily: 'sawarabi',
    );

    const descriptionStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.red,
      fontFamily: 'sawarabi',
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: buildAppBar("開発言語-Flutter-"),
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

                //画�?
                Stack(
                  children: [
                    CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: img_trans.length,
                      options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2,
                          autoPlayCurve: Curves.easeInExpo,
                          autoPlayAnimationDuration: const Duration(seconds: 3),
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

                Text("翻訳アプリ", style: appStyle),

                const SizedBox(
                  height: 40,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Text("", style: descriptionStyle),
                ),

                const SizedBox(
                  height: 40,
                ),

                buildAppleStoreButton(onClick: transIOSURL),

                const SizedBox(
                  height: 40,
                ),

                buildGooglePlayButton(onClick: translateAndroidURL),

                const SizedBox(
                  height: 100,
                ),

                Divider(
                  thickness: 3,
                  color: Colors.red,
                ),

                const SizedBox(
                  height: 100,
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
                          autoPlayAnimationDuration: const Duration(seconds: 3),
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
                        final fpsImg = img_pass[index];
                        return buildImage(fpsImg);
                      },
                    ),
                  ],
                ),

                Text("パスワード管理アプリ", style: appStyle),

                const SizedBox(
                  height: 40,
                ),

                Text("", style: descriptionStyle),

                const SizedBox(
                  height: 40,
                ),

                buildAppleStoreButton(onClick: psportIOSURL),

                const SizedBox(
                  height: 40,
                ),

                buildGooglePlayButton(onClick: psportAndroidURL),

                const SizedBox(
                  height: 40,
                ),

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
