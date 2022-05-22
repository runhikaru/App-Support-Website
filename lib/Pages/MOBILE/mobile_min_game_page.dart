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
                    appName: "フーマの大冒険\n(Android用)",
                    onClick: _foomAppURL,
                    backColor: Colors.blue,
                    sideColor: Colors.white,
                    textColor: Colors.white),
                const SizedBox(
                  height: 80,
                ),
                Image.asset("assets/app/other_game/fo.png"),
                const SizedBox(
                  height: 80,
                ),
                buildAppLink(
                    image: "assets/app/other_game/fo.png",
                    appName: "おじさんで積み木\n(Android用)",
                    onClick: _ozisanAppURL,
                    backColor: Colors.blue,
                    sideColor: Colors.white,
                    textColor: Colors.white),
                const SizedBox(
                  height: 80,
                ),
                Image.asset("assets/app/other_game/ozi.png"),
                const SizedBox(
                  height: 80,
                ),
                buildAppLink(
                    image: "assets/app/apps_icon/hcasual.png",
                    appName: "スタックボール\n(Android用)",
                    onClick: _ozisanAppURL,
                    backColor: Colors.blue,
                    sideColor: Colors.white,
                    textColor: Colors.white),
                const SizedBox(
                  height: 80,
                ),
                Image.asset("assets/app/apek_app/apek1.png"),
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

  Future<void> _foomAppURL() async => await canLaunch(foomApp)
      ? await launch(foomApp)
      : throw 'Could not launch $foomApp';

  Future<void> _ozisanAppURL() async => await canLaunch(ozisanApp)
      ? await launch(ozisanApp)
      : throw 'Could not launch $ozisanApp';

  Future<void> _stackBallAppURL() async => await canLaunch(stackBallApp)
      ? await launch(stackBallApp)
      : throw 'Could not launch $stackBallApp';

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
