import 'package:app_support_website/utils.dart';
import 'package:flutter/material.dart';

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
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  buildAppURLButton(
                      image: "assets/app/apps_icon/foom_logo.png",
                      appName: "フーマ冒険\n(Apple Store)",
                      onClick: foomIOSURL,
                      ios: true,
                      apple: true,
                      mobile: true,
                      textColor: Colors.white),
                  const SizedBox(
                    height: 40,
                  ),
                  buildAppURLButton(
                      image: "assets/app/apps_icon/foom_logo.png",
                      appName: "フーマの大冒険\n(プレイストア)",
                      onClick: foomAndroidURL,
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
                          height: 400, "assets/app/other_game/foom.png")),
                  const SizedBox(
                    height: 200,
                  ),
                  buildAppURLButton(
                      image: "assets/app/apps_icon/ozisan.png",
                      appName: "おじさんで積み木\n(プレイストア)",
                      onClick: ozisanAndroidURL,
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
                          height: 400, "assets/app/other_game/ozitumiki.png")),
                  const SizedBox(
                    height: 200,
                  ),
                  buildAppURLButton(
                      image: "assets/app/apps_icon/hcasual.png",
                      appName: "スタックボール\n(プレイストア)",
                      onClick: stackBallAndroidURL,
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
                        height: 400, "assets/app/other_game/stack.png"),
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
