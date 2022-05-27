import 'package:app_support_website/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    'assets/app/apek_app/apek2.png',
    'assets/app/apek_app/apek3.png',
    'assets/app/apek_app/apek4.png',
    'assets/app/apek_app/apek5.png',
  ];

  final controller2 = CarouselController();
  int activeIndex2 = 0;
  final img_escHospital = [
    'assets/app/other_game/escSchool.png',
    'assets/app/other_game/escHospital.png',
  ];

  final controller3 = CarouselController();
  int activeIndex3 = 0;
  final img_escSchool = [
    'assets/app/other_game/escSchool.png',
    'assets/app/other_game/escHospital.png',
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
                    image: "assets/app/apek_app/apek_logo.png",
                    appName: "Apek\n(プレイストア)",
                    onClick: escHospitalAndroidURL,
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
                    image: "assets/app/apps_icon/esc_hospital_logo.png",
                    appName: "脱出ゲーム -廃病院-\n(Apple Store)",
                    onClick: escHospitalAppIOSURL,
                    gradC1: Color.fromARGB(255, 24, 203, 247),
                    gradC2: Color.fromARGB(255, 3, 64, 231),
                    shadowColor: const Color.fromARGB(255, 236, 173, 102)
                        .withOpacity(.5),
                    textColor: Colors.white),

                const SizedBox(
                  height: 80,
                ),

                buildAppLink(
                    image: "assets/app/apps_icon/esc_hospital_logo.png",
                    appName: "脱出ゲーム -廃病院-\n(プレイストア)",
                    onClick: escSchoolAndroidURL,
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
                      itemCount: img_escHospital.length,
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
                        final escHospital = img_escHospital[index];
                        return buildImage(escHospital);
                      },
                    ),
                  ],
                ),

                const SizedBox(
                  height: 80,
                ),

                buildAppLink(
                    image: "assets/app/apps_icon/esc_logo.png",
                    appName: "脱出ゲーム -学校の教室-\n(プレイストア)",
                    onClick: escSchoolAndroidURL,
                    gradC1: Color.fromARGB(255, 21, 218, 119),
                    gradC2: Color.fromARGB(255, 219, 125, 11),
                    shadowColor: const Color.fromARGB(255, 107, 224, 253)
                        .withOpacity(.5),
                    textColor: Colors.white),

                const SizedBox(
                  height: 80,
                ),

                Stack(
                  children: [
                    CarouselSlider.builder(
                      carouselController: controller3,
                      itemCount: img_escSchool.length,
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
                              activeIndex3 = index;
                            });
                          }),
                      itemBuilder: (ctx, index, realIndex) {
                        final escSchool = img_escSchool[index];
                        return buildImage(escSchool);
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
