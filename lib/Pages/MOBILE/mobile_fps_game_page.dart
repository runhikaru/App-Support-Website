import 'package:app_support_website/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

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
    'assets/app/apek_app/apek2.png',
    'assets/app/apek_app/apek3.png',
    'assets/app/apek_app/apek4.png',
    'assets/app/apek_app/apek5.png',
  ];

  final controller2 = CarouselController();
  int activeIndex2 = 0;
  final img_icons2 = [
    'assets/app/fps_app/fps1.png',
    'assets/app/fps_app/fps2.png',
    'assets/app/fps_app/fps3.png',
    'assets/app/fps_app/fps4.png',
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
                  height: 100,
                ),

                buildAppLink(
                    image: "assets/app/apek_app/apek_logo.png",
                    appName: "Apek Legends\n(プレイストア)",
                    onClick: apekAndroidURL,
                    gradC1: Color.fromARGB(255, 21, 218, 119),
                    gradC2: Color.fromARGB(255, 219, 125, 11),
                    shadowColor: const Color.fromARGB(255, 107, 224, 253)
                        .withOpacity(.5),
                    textColor: Colors.white),

                const SizedBox(
                  height: 80,
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
                          autoPlayAnimationDuration: const Duration(seconds: 2),
                          height: 400,
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
                  height: 80,
                ),

                buildAppLink(
                    image: "assets/app/apps_icon/fps_logo.png",
                    appName: "荒野運動\n(プレイストア)",
                    onClick: fpsAndroidURL,
                    gradC1: Color.fromARGB(255, 21, 218, 119),
                    gradC2: Color.fromARGB(255, 219, 125, 11),
                    shadowColor: const Color.fromARGB(255, 107, 224, 253)
                        .withOpacity(.5),
                    textColor: Colors.white),

                const SizedBox(
                  height: 80,
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
                          autoPlayAnimationDuration: const Duration(seconds: 2),
                          height: 400,
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
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAppLink(
          {required String image,
          required String appName,
          required Function onClick,
          required Color gradC1,
          required Color gradC2,
          required Color shadowColor,
          required Color textColor}) =>
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GestureDetector(
          onTap: () {
            onClick();
          },
          child: SizedBox(
            height: 75,
            width: 300,
            child: Container(
              decoration:
                  appButtonBoxDecration(10, gradC1, gradC2, shadowColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    RichText(
                      text: TextSpan(
                          text: appName,
                          style: TextStyle(
                              fontFamily: "kaisei",
                              color: textColor,
                              fontSize: 15,
                              decoration: TextDecoration.underline)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildButton(Function op) => Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.deepOrangeAccent,
                        Colors.pinkAccent,
                        Colors.yellowAccent
                      ])),
              child: IconButton(
                  onPressed: previous,
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 60,
                    color: Colors.white,
                  )),
            ),
            const Spacer(),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.deepOrangeAccent,
                        Colors.pinkAccent,
                        Colors.yellowAccent
                      ])),
              child: IconButton(
                  onPressed: () {
                    op();
                  },
                  icon: const Icon(Icons.arrow_forward,
                      size: 60, color: Colors.white)),
            )
          ],
        ),
      );

  void animateToSlide(int index) => controller.animateToPage(index);

  void next() => controller.nextPage(duration: const Duration(seconds: 1));

  void previous() =>
      controller.previousPage(duration: const Duration(seconds: 1));

  Widget buildImage(String imageName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
          decoration: const BoxDecoration(color: Colors.black),
          width: double.infinity,
          child: Image.asset(
            imageName,
            fit: BoxFit.contain,
          )),
    );
  }

  Widget buildIndicator1() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: img_apek.length,
      onDotClicked: animateToSlide,
      duration: const Duration(seconds: 1),
      effect: const ExpandingDotsEffect(
          activeDotColor: Colors.orange,
          dotColor: Colors.grey,
          dotWidth: 20,
          dotHeight: 20),
    );
  }
}
