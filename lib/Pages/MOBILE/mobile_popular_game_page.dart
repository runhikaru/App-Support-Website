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
    'assets/app/apek_app/apek.png',
    'assets/app/apek_app/apek1.png',
    'assets/app/apek_app/apek2.png',
    'assets/app/apek_app/apek3.png',
  ];

  @override
  Widget build(BuildContext context) {
    const subtitleStyle = TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: "sawarabi");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: buildAppBar("人気ゲーム"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text("ダウンロード数 1位",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 236, 23),
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          fontFamily: "sawarabi")),
                  const SizedBox(
                    height: 40,
                  ),
                  Text("総ダウンロード数3000突破!!!\nアップルストア＆プレイストア共にランキング入り\nリアル廃病院からの脱出ゲーム",
                      style: subtitleStyle),
                  const SizedBox(
                    height: 20,
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
                    height: 40,
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
                    height: 40,
                  ),
                  SizedBox(
                      height: 270,
                      child:
                          Image.asset("assets/app/other_game/escHospital.png")),
                  const SizedBox(
                    height: 200,
                  ),
                  Text("ダウンロード数 2位",
                      style: TextStyle(
                          color: Color.fromARGB(255, 161, 159, 159),
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          fontFamily: "sawarabi")),
                  const SizedBox(
                    height: 40,
                  ),
                  Text("夜の学校からの謎解き＆脱出ゲーム\nプレイストアにランキング入り", style: subtitleStyle),
                  const SizedBox(
                    height: 20,
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
                    height: 40,
                  ),
                  SizedBox(
                      height: 270,
                      child:
                          Image.asset("assets/app/other_game/escSchool.png")),

                  const SizedBox(
                    height: 200,
                  ),
                  Text("ダウンロード数 3位",
                      style: TextStyle(
                          color: Color.fromARGB(255, 152, 54, 5),
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          fontFamily: "sawarabi")),
                  const SizedBox(
                    height: 40,
                  ),
                  Text("躍動感が溢れる銃撃戦\n城内で襲いくる敵を粉砕しろ!!!", style: subtitleStyle),
                  const SizedBox(
                    height: 20,
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
                            autoPlayAnimationDuration:
                                const Duration(seconds: 2),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
