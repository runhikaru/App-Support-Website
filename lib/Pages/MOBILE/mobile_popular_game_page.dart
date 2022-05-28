import 'package:app_support_website/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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

                buildAppURLButton(
                    image: "assets/app/apek_app/apek_logo.png",
                    appName: "Apek Legends\n(Apple Store)",
                    onClick: apekIOSURL,
                    ios: true,
                    apple: true,
                    mobile: true,
                    textColor: Colors.white),

                const SizedBox(
                  height: 80,
                ),

                buildAppURLButton(
                    image: "assets/app/apek_app/apek_logo.png",
                    appName: "Apek\n(プレイストア)",
                    onClick: escHospitalAndroidURL,
                    ios: false,
                    apple: false,
                    mobile: true,
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

                buildAppURLButton(
                    image: "assets/app/apps_icon/esc_hospital_logo.png",
                    appName: "脱出ゲーム -廃病院-\n(Apple Store)",
                    onClick: escHospitalIOSURL,
                    ios: true,
                    apple: true,
                    mobile: true,
                    textColor: Colors.white),

                const SizedBox(
                  height: 80,
                ),

                buildAppURLButton(
                    image: "assets/app/apps_icon/esc_hospital_logo.png",
                    appName: "脱出ゲーム -廃病院-\n(プレイストア)",
                    onClick: escSchoolAndroidURL,
                    ios: false,
                    apple: false,
                    mobile: true,
                    textColor: Colors.white),

                const SizedBox(
                  height: 80,
                ),

                SizedBox(
                    height: 400,
                    child:
                        Image.asset("assets/app/other_game/escHospital.png")),

                const SizedBox(
                  height: 80,
                ),

                buildAppURLButton(
                    image: "assets/app/apps_icon/esc_logo.png",
                    appName: "脱出ゲーム -学校の教室-\n(プレイストア)",
                    onClick: escSchoolAndroidURL,
                    ios: false,
                    apple: false,
                    mobile: true,
                    textColor: Colors.white),

                const SizedBox(
                  height: 80,
                ),

                SizedBox(
                    height: 400,
                    child:
                        Image.asset("assets/app/other_game/escSchool.png")),

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
