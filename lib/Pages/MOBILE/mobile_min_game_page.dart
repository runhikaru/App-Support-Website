import 'package:app_support_website/utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileMinGamePage extends StatefulWidget {
  const MobileMinGamePage({Key? key}) : super(key: key);

  @override
  _MobileMinGamePageState createState() => _MobileMinGamePageState();
}

class _MobileMinGamePageState extends State<MobileMinGamePage> {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: buildAppBar("ミニゲーム"),
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
                    image: "assets/app/apps_icon/foom_logo.png",
                    appName: "フーマ冒険\n(Apple Store)",
                    onClick: foomIOSURL,
                    gradC1: Color.fromARGB(255, 24, 203, 247),
                    gradC2: Color.fromARGB(255, 3, 64, 231),
                    shadowColor: const Color.fromARGB(255, 236, 173, 102)
                        .withOpacity(.5),apple: true,mobile: true,
                    textColor: Colors.white),
                const SizedBox(
                  height: 80,
                ),
                buildAppURLButton(
                    image: "assets/app/apps_icon/foom_logo.png",
                    appName: "フーマの大冒険\n(プレイストア)",
                    onClick: foomAndroidURL,
                    gradC1: Color.fromARGB(255, 21, 218, 119),
                    gradC2: Color.fromARGB(255, 219, 125, 11),
                    shadowColor: const Color.fromARGB(255, 107, 224, 253)
                        .withOpacity(.5),apple: false,mobile: true,
                    textColor: Colors.white),
                const SizedBox(
                  height: 80,
                ),
                Image.asset(height: 400, "assets/app/other_game/foom.png"),
                const SizedBox(
                  height: 80,
                ),
                buildAppURLButton(
                    image: "assets/app/apps_icon/ozisan.png",
                    appName: "おじさんで積み木\n(プレイストア)",
                    onClick: ozisanAndroidURL,
                    gradC1: Color.fromARGB(255, 21, 218, 119),
                    gradC2: Color.fromARGB(255, 219, 125, 11),
                    shadowColor: const Color.fromARGB(255, 107, 224, 253)
                        .withOpacity(.5),apple: false,mobile: true,
                    textColor: Colors.white),
                const SizedBox(
                  height: 80,
                ),
                Image.asset(height: 400, "assets/app/other_game/ozitumiki.png"),
                const SizedBox(
                  height: 80,
                ),
                buildAppURLButton(
                    image: "assets/app/apps_icon/hcasual.png",
                    appName: "スタックボール\n(プレイストア)",
                    onClick: stackBallAndroidURL,
                    gradC1: Color.fromARGB(255, 21, 218, 119),
                    gradC2: Color.fromARGB(255, 219, 125, 11),
                    shadowColor: const Color.fromARGB(255, 107, 224, 253)
                        .withOpacity(.5),apple: false,mobile: true,
                    textColor: Colors.white),
                const SizedBox(
                  height: 80,
                ),
                Image.asset(height: 400, "assets/app/other_game/stack.png"),
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
