import 'package:app_support_website/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MobileFPSGamePage extends StatefulWidget {
  const MobileFPSGamePage({Key? key}) : super(key: key);

  @override
  _MobileFPSGamePageState createState() => _MobileFPSGamePageState();
}

class _MobileFPSGamePageState extends State<MobileFPSGamePage> {
  final ScrollController scrollController = ScrollController();

  final controller = CarouselController();
  int activeIndex = 0;
  final img_apek = [
    'assets/app/apek_app/apek.png',
    'assets/app/apek_app/apek1.png',
    'assets/app/apek_app/apek2.png',
    'assets/app/apek_app/apek3.png',
  ];

  final controller2 = CarouselController();
  int activeIndex2 = 0;
  final img_icons2 = [
    'assets/app/kouya_app/kouya1.png',
    'assets/app/kouya_app/kouya2.png',
    'assets/app/kouya_app/kouya3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: buildAppBar("FPSゲーム"),
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
                    image: "assets/app/apek_app/apek_logo.png",
                    appName: "Apek Legends\n(Apple Store)",
                    onClick: apekIOSURL,
                    ios: true,
                    apple: true,
                    mobile: true,
                    textColor: Colors.white),

                const SizedBox(
                  height: 40,
                ),

                buildAppURLButton(
                    image: "assets/app/apek_app/apek_logo.png",
                    appName: "Apek Legends\n(プレイストア)",
                    onClick: apekAndroidURL,
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
                      itemCount: img_apek.length,
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
                              activeIndex = index;
                            });
                          }),
                      itemBuilder: (ctx, index, realIndex) {
                        final apekImg = img_apek[index];
                        return buildImage(apekImg);
                      },
                    ),
                  ],
                ),

                const SizedBox(
                  height: 200,
                ),

                buildAppURLButton(
                    image: "assets/app/apps_icon/fps_logo.png",
                    appName: "荒野運動\n(プレイストア)",
                    onClick: fpsAndroidURL,
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
                      itemCount: img_icons2.length,
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
                        final fpsImg = img_icons2[index];
                        return buildImage(fpsImg);
                      },
                    ),
                  ],
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
