import 'package:app_support_website/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MobilePopularGamePage extends StatefulWidget {
  const MobilePopularGamePage({Key? key}) : super(key: key);

  @override
  _MobilePopularGamePageState createState() => _MobilePopularGamePageState();
}

class _MobilePopularGamePageState extends State<MobilePopularGamePage> {
  final ScrollController scrollController = ScrollController();

  final controller = CarouselController();
  int activeIndex = 0;
  final img_apek = [
    'assets/app/apek_app/apek1.png',
    'assets/app/apek_app/apek2.png',
    'assets/app/apek_app/apek3.png',
    'assets/app/apek_app/apek4.png',
  ];

  final controller2 = CarouselController();
  int activeIndex2 = 0;
  final img_icons2 = [
    'assets/app/memo_app/pp1.png',
    'assets/app/memo_app/pp2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: buildAppBar("人気ゲーム"),
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
                    image: "assets/app/apps_icon/esc_hospital_logo.png",
                    appName: "脱出ゲーム -廃病院-\n(Android用)",
                    onClick: _escHospitalAppURL,
                    backColor: Colors.blue,
                    sideColor: Colors.white,
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
                    image: "assets/app/apps_icon/esc_logo.png",
                    appName: "脱出ゲーム -学校の教室-\n(Android用)",
                    onClick: _escAppURL,
                    backColor: Colors.blue,
                    sideColor: Colors.white,
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
          required Color backColor,
          required Color sideColor,
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
              decoration: buildBoxDecration(10),
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

  Future<void> _escAppURL() async => await canLaunch(escApp)
      ? await launch(escApp)
      : throw 'Could not launch $escApp';

  Future<void> _escHospitalAppURL() async => await canLaunch(escHospitalApp)
      ? await launch(escHospitalApp)
      : throw 'Could not launch $escHospitalApp';

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
}
