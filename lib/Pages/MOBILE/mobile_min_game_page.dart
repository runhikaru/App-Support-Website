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
                buildAppLink(
                    image: "assets/app/apps_icon/foom_logo.png",
                    appName: "フーマ冒険\n(Apple Store)",
                    onClick: foomAppIOSURL,
                    gradC1: Color.fromARGB(255, 24, 203, 247),
                    gradC2: Color.fromARGB(255, 3, 64, 231),
                    shadowColor: const Color.fromARGB(255, 236, 173, 102)
                        .withOpacity(.5),
                    textColor: Colors.white),
                const SizedBox(
                  height: 80,
                ),
                buildAppLink(
                    image: "assets/app/apps_icon/foom_logo.png",
                    appName: "フーマの大冒険\n(プレイストア)",
                    onClick: foomAndroidURL,
                    gradC1: Color.fromARGB(255, 21, 218, 119),
                    gradC2: Color.fromARGB(255, 219, 125, 11),
                    shadowColor: const Color.fromARGB(255, 107, 224, 253)
                        .withOpacity(.5),
                    textColor: Colors.white),
                const SizedBox(
                  height: 80,
                ),
                Image.asset(height: 400, "assets/app/other_game/foom.png"),
                const SizedBox(
                  height: 80,
                ),
                buildAppLink(
                    image: "assets/app/apps_icon/ozisan.png",
                    appName: "おじさんで積み木\n(プレイストア)",
                    onClick: ozisanAndroidURL,
                    gradC1: Color.fromARGB(255, 21, 218, 119),
                    gradC2: Color.fromARGB(255, 219, 125, 11),
                    shadowColor: const Color.fromARGB(255, 107, 224, 253)
                        .withOpacity(.5),
                    textColor: Colors.white),
                const SizedBox(
                  height: 80,
                ),
                Image.asset(height: 400, "assets/app/other_game/ozitumiki.png"),
                const SizedBox(
                  height: 80,
                ),
                buildAppLink(
                    image: "assets/app/apps_icon/hcasual.png",
                    appName: "スタックボール\n(プレイストア)",
                    onClick: stackBallAndroidURL,
                    gradC1: Color.fromARGB(255, 21, 218, 119),
                    gradC2: Color.fromARGB(255, 219, 125, 11),
                    shadowColor: const Color.fromARGB(255, 107, 224, 253)
                        .withOpacity(.5),
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
