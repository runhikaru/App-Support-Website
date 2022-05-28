import 'package:app_support_website/utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MobileServicePage extends StatefulWidget {
  final GlobalKey topKey;

  const MobileServicePage({super.key, required this.topKey});

  @override
  _MobileServicePageState createState() => _MobileServicePageState();
}

class _MobileServicePageState extends State<MobileServicePage> {
  final ScrollController scrollController = ScrollController();

  final YoutubePlayerController _Ycontroller = YoutubePlayerController(
    initialVideoId: 'RJsoKYYhvcM',
    params: const YoutubePlayerParams(
        startAt: Duration(seconds: 0),
        showControls: true,
        showFullscreenButton: true,
        autoPlay: false),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              key: widget.topKey,
              height: 100,
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "システム開発",
                style: TextStyle(
                    fontSize: 40, color: Colors.white, fontFamily: "sawarabi"),
              ),
            ),

            const SizedBox(
              height: 100,
            ),

            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 230,
                  width: 490,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.7),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: YoutubePlayerControllerProvider(
                    controller: _Ycontroller,
                    child: const YoutubePlayerIFrame(
                      aspectRatio: 16 / 9,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 200,
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "ゲーム開発",
                style: TextStyle(
                    fontSize: 40, color: Colors.white, fontFamily: "sawarabi"),
              ),
            ),

            const SizedBox(
              height: 100,
            ),

            buildAppURLButton(
                image: "assets/app/apek_app/apek_logo.png",
                appName: "Apek Legends\n(Apple Store)",
                onClick: apekIOSURL,
                gradC1: Color.fromARGB(255, 24, 203, 247),
                gradC2: Color.fromARGB(255, 3, 64, 231),
                shadowColor:
                    const Color.fromARGB(255, 236, 173, 102).withOpacity(.5),
                apple: true,
                mobile: true,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),

            buildAppURLButton(
                image: "assets/app/apek_app/apek_logo.png",
                appName: "Apek Legends\n(プレイストア)",
                onClick: apekAndroidURL,
                gradC1: Color.fromARGB(255, 21, 218, 119),
                gradC2: Color.fromARGB(255, 219, 125, 11),
                shadowColor:
                    const Color.fromARGB(255, 107, 224, 253).withOpacity(.5),
                apple: false,
                mobile: true,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),

            SizedBox(
              height: 400,
              child: Image.asset(
                "assets/app/apek_app/apek.png",
              ),
            ),

            const SizedBox(
              height: 80,
            ),

            // buildAppURLButton(
            //     image: "assets/app/apps_icon/fps_logo.png",
            //     appName: "荒野運動\n(プレイストア)",
            //     onClick: fpsAndroidURL,
            //     gradC1: Color.fromARGB(255, 21, 218, 119),
            //     gradC2: Color.fromARGB(255, 219, 125, 11),
            //     shadowColor:
            //         const Color.fromARGB(255, 107, 224, 253).withOpacity(.5),
            //     apple: false,
            //     mobile: true,
            //     textColor: Colors.white),

            // const SizedBox(
            //   height: 80,
            // ),

            // SizedBox(
            //     height: 400,
            //     child: Image.asset("assets/app/apek_app/apek1.png")),

            // const SizedBox(
            //   height: 80,
            // ),

            buildAppURLButton(
                image: "assets/app/apps_icon/esc_hospital_logo.png",
                appName: "脱出ゲーム -廃病院-\n(Apple Store)",
                onClick: escHospitalIOSURL,
                gradC1: Color.fromARGB(255, 24, 203, 247),
                gradC2: Color.fromARGB(255, 3, 64, 231),
                shadowColor:
                    const Color.fromARGB(255, 236, 173, 102).withOpacity(.5),
                apple: true,
                mobile: true,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),

            buildAppURLButton(
                image: "assets/app/apps_icon/esc_hospital_logo.png",
                appName: "脱出ゲーム -廃病院-\n(プレイストア)",
                onClick: escHospitalAndroidURL,
                gradC1: Color.fromARGB(255, 21, 218, 119),
                gradC2: Color.fromARGB(255, 219, 125, 11),
                shadowColor:
                    const Color.fromARGB(255, 107, 224, 253).withOpacity(.5),
                apple: false,
                mobile: true,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),

            SizedBox(
                height: 400,
                child: Image.asset("assets/app/other_game/escHospital.png")),

            const SizedBox(
              height: 80,
            ),

            buildAppURLButton(
                image: "assets/app/apps_icon/esc_logo.png",
                appName: "脱出ゲーム -学校の教室-\n(プレイストア)",
                onClick: escSchoolAndroidURL,
                gradC1: Color.fromARGB(255, 21, 218, 119),
                gradC2: Color.fromARGB(255, 219, 125, 11),
                shadowColor:
                    const Color.fromARGB(255, 107, 224, 253).withOpacity(.5),
                apple: false,
                mobile: true,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),
            SizedBox(
                height: 400,
                child: Image.asset("assets/app/other_game/escSchool.png")),

            const SizedBox(
              height: 80,
            ),

            buildAppURLButton(
                image: "assets/app/apps_icon/foom_logo.png",
                appName: "フーマ冒険\n(Apple Store)",
                onClick: foomIOSURL,
                gradC1: Color.fromARGB(255, 24, 203, 247),
                gradC2: Color.fromARGB(255, 3, 64, 231),
                shadowColor:
                    const Color.fromARGB(255, 236, 173, 102).withOpacity(.5),
                apple: true,
                mobile: true,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),

            buildAppURLButton(
                image: "assets/app/apps_icon/foom_logo.png",
                appName: "フーマ冒険\n(プレイストア)",
                onClick: foomAndroidURL,
                gradC1: Color.fromARGB(255, 21, 218, 119),
                gradC2: Color.fromARGB(255, 219, 125, 11),
                shadowColor:
                    const Color.fromARGB(255, 107, 224, 253).withOpacity(.5),
                apple: false,
                mobile: true,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),
            SizedBox(
                height: 400,
                child: Image.asset("assets/app/other_game/foom.png")),

            const SizedBox(
              height: 80,
            ),

            buildAppURLButton(
                image: "assets/app/apps_icon/ozisan.png",
                appName: "おじさんで積み木\n(プレイストア)",
                onClick: ozisanAndroidURL,
                gradC1: Color.fromARGB(255, 21, 218, 119),
                gradC2: Color.fromARGB(255, 219, 125, 11),
                shadowColor:
                    const Color.fromARGB(255, 107, 224, 253).withOpacity(.5),
                apple: false,
                mobile: true,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),
            SizedBox(
                height: 400,
                child: Image.asset("assets/app/other_game/ozitumiki.png")),

            const SizedBox(
              height: 80,
            ),

            buildAppURLButton(
                image: "assets/app/apps_icon/hcasual.png",
                appName: "スタックボール\n(プレイストア)",
                onClick: stackBallAndroidURL,
                gradC1: Color.fromARGB(255, 21, 218, 119),
                gradC2: Color.fromARGB(255, 219, 125, 11),
                shadowColor:
                    const Color.fromARGB(255, 107, 224, 253).withOpacity(.5),
                apple: false,
                mobile: true,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),
            SizedBox(
                height: 400,
                child: Image.asset("assets/app/other_game/stack.png")),

            const SizedBox(
              height: 200,
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "スマホアプリ開発",
                style: TextStyle(
                    fontSize: 40, color: Colors.white, fontFamily: "sawarabi"),
              ),
            ),

            const SizedBox(
              height: 100,
            ),

            //翻訳アプリ androi
            buildAppURLButton(
                image: "assets/app/apps_icon/translation.png",
                appName: "翻訳アプリ\n(プレイストア)",
                onClick: translateAndroidURL,
                gradC1: Color.fromARGB(255, 21, 218, 119),
                gradC2: Color.fromARGB(255, 219, 125, 11),
                shadowColor:
                    const Color.fromARGB(255, 107, 224, 253).withOpacity(.5),
                apple: false,
                mobile: true,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),

            SizedBox(
                height: 400,
                child: Image.asset("assets/app/other_game/trans.png")),

            const SizedBox(
              height: 80,
            ),

            // Stack(
            //   alignment: Alignment.center,
            //   children: [
            //     Container(
            //       height: 230,
            //       width: 490,
            //       decoration: BoxDecoration(
            //         color: Colors.white.withOpacity(0.3),
            //         border: Border.all(
            //           color: Colors.white.withOpacity(0.7),
            //         ),
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //     ),
            //     SizedBox(
            //       height: 200,
            //       child: YoutubePlayerControllerProvider(
            //         controller: _Ycontroller3,
            //         child: const YoutubePlayerIFrame(
            //           aspectRatio: 16 / 9,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            // const SizedBox(
            //   height: 80,
            // ),

            buildAppURLButton(
                image: "assets/app/apps_icon/memo_logo.png",
                appName: "シンプルなメモ帳\n(プレイストア)",
                onClick: memoAndroidURL,
                gradC1: Color.fromARGB(255, 21, 218, 119),
                gradC2: Color.fromARGB(255, 219, 125, 11),
                shadowColor:
                    const Color.fromARGB(255, 107, 224, 253).withOpacity(.5),
                apple: false,
                mobile: true,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),

            SizedBox(
                height: 400,
                child: Image.asset("assets/app/other_game/memo.png")),

            const SizedBox(
              height: 80,
            ),

            buildAppURLButton(
                image: "assets/app/apps_icon/ps_logo.png",
                appName: "パスワード管理アプリ\n(プレイストア)",
                onClick: psportAndroidURL,
                gradC1: Color.fromARGB(255, 21, 218, 119),
                gradC2: Color.fromARGB(255, 219, 125, 11),
                shadowColor:
                    const Color.fromARGB(255, 107, 224, 253).withOpacity(.5),
                apple: false,
                mobile: true,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),

            SizedBox(
                height: 400,
                child: Image.asset("assets/app/other_game/pass.png")),

            const SizedBox(
              height: 80,
            ),
            //Ok Google kun androi
            buildAppURLButton(
                image: "assets/app/apps_icon/ai_g_logo.png",
                appName: "OK グーグル君\n(プレイストア)",
                onClick: okGoogleAndroidURL,
                gradC1: Color.fromARGB(255, 21, 218, 119),
                gradC2: Color.fromARGB(255, 219, 125, 11),
                shadowColor:
                    const Color.fromARGB(255, 107, 224, 253).withOpacity(.5),
                apple: false,
                mobile: true,
                textColor: Colors.white),

            const SizedBox(height: 80),

            const SizedBox(height: 150),

            const Divider(
              color: Colors.white,
              thickness: 2,
            ),

            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("(c) 2021 MHikaru inc.",
                      style: TextStyle(
                          fontSize: 13, color: Colors.white.withOpacity(0.5))),
                ))
          ],
        ),
      ),
    );
  }
}
