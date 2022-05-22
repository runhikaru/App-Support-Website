import 'package:app_support_website/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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

            buildAppLink(
                image: "assets/app/apek_app/apek_logo.png",
                appName: "Apek Legends\n(Android用)",
                onClick: _apekAppURL,
                backColor: Colors.blue,
                sideColor: Colors.white,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),

            SizedBox(
              height: 280,
              width: 500,
              child: Image.asset(
                "assets/app/apek_app/apek1.png",
              ),
            ),

            const SizedBox(
              height: 80,
            ),

            buildAppLink(
                image: "assets/app/apps_icon/fps_logo.png",
                appName: "荒野運動\n(Android用)",
                onClick: _fpsAppURL,
                backColor: Colors.blue,
                sideColor: Colors.white,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),
            SizedBox(
                height: 280,
                width: 500,
                child: Image.asset("assets/app/apek_app/apek1.png")),

            const SizedBox(
              height: 80,
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
            SizedBox(
                height: 280,
                width: 500,
                child: Image.asset("assets/app/apek_app/apek1.png")),

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
            SizedBox(
                height: 280,
                width: 500,
                child: Image.asset("assets/app/apek_app/apek1.png")),

            const SizedBox(
              height: 80,
            ),

            buildAppLink(
                image: "assets/app/apps_icon/foom_logo.png",
                appName: "フーマ冒険\n(Android用)",
                onClick: _foomAppURL,
                backColor: Colors.blue,
                sideColor: Colors.white,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),
            SizedBox(
                height: 280,
                width: 500,
                child: Image.asset("assets/app/other_game/fo.png")),

            const SizedBox(
              height: 80,
            ),

            buildAppLink(
                image: "assets/app/apps_icon/ozisan.png",
                appName: "おじさんで積み木\n(Android用)",
                onClick: _ozisanAppURL,
                backColor: Colors.blue,
                sideColor: Colors.white,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),
            SizedBox(
                height: 280,
                width: 500,
                child: Image.asset("assets/app/other_game/ozi.png")),

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

            //翻訳アプリ ios
            // buildAppLink(
            //     image: "assets/translation.png",
            //     appName: "翻訳アプリ\n(iPhone用)",
            //     onClick: _translateAppleAppURL,
            //     backColor: Colors.white,
            //     sideColor: Colors.red,
            //     textColor: Colors.blue),
            //翻訳アプリ androi
            buildAppLink(
                image: "assets/app/apps_icon/translation.png",
                appName: "翻訳アプリ\n(Android用)",
                onClick: _translateAppURL,
                backColor: Colors.blue,
                sideColor: Colors.white,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),

            SizedBox(
                height: 280,
                width: 500,
                child: Image.asset("assets/app/memo_app/translation.png")),

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

            buildAppLink(
                image: "assets/app/apps_icon/memo_logo.png",
                appName: "シンプルなメモ帳\n(Android用)",
                onClick: _memoAppURL,
                backColor: Colors.blue,
                sideColor: Colors.white,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),

            SizedBox(
                height: 280,
                width: 500,
                child: Image.asset("assets/app/memo_app/memo.png")),

            const SizedBox(
              height: 80,
            ),

            buildAppLink(
                image: "assets/app/apps_icon/ps_logo.png",
                appName: "パスワード管理アプリ\n(Android用)",
                onClick: _ps_memoAppURL,
                backColor: Colors.blue,
                sideColor: Colors.white,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),

            SizedBox(
                height: 280,
                width: 500,
                child: Image.asset("assets/app/memo_app/pp1.png")),

            const SizedBox(
              height: 80,
            ),
            //Ok Google kun androi
            buildAppLink(
                image: "assets/app/apps_icon/ai_g_logo.png",
                appName: "OK グーグル君\n(Android用)",
                onClick: _okGoogleApp,
                backColor: Colors.blue,
                sideColor: Colors.white,
                textColor: Colors.white),

            const SizedBox(
              height: 80,
            ),

            //Ok Google kun androi English
            buildAppLink(
                image: "assets/app/apps_icon/ai_g_logo.png",
                appName: "OK グーグル君\n-英語版-",
                onClick: _okGoogleEnglishApp,
                backColor: Colors.blue,
                sideColor: Colors.white,
                textColor: Colors.white),

            // const SizedBox(
            //   height: 100,
            // ),

            // const Text(
            //   "音源制�?",
            //   style: TextStyle(
            //       fontSize: 40,
            //       color: Colors.white,
            //       fontFamily: "sawarabi"),
            // ),

            // const SizedBox(
            //   height: 120,
            // ),

            // Stack(
            //   alignment: AlignmentDirectional.center,
            //   children: [
            //     Container(
            //       height: 200,
            //       width: double.infinity,
            //       color: Colors.white,
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 60.0),
            //       child: SizedBox(
            //         height: 150,
            //         child: YoutubePlayerControllerProvider(
            //           controller: _Ycontroller4,
            //           child: const YoutubePlayerIFrame(
            //             aspectRatio: 16 / 9,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            // const SizedBox(
            //   height: 50,
            // ),

            // Stack(
            //   alignment: AlignmentDirectional.center,
            //   children: [
            //     Container(
            //       height: 200,
            //       width: double.infinity,
            //       color: Colors.white,
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 60.0),
            //       child: SizedBox(
            //         height: 150,
            //         child: YoutubePlayerControllerProvider(
            //           controller: _Ycontroller5,
            //           child: const YoutubePlayerIFrame(
            //             aspectRatio: 16 / 9,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 100,
            ),
          ],
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

  Future<void> _cookAppURL() async => await canLaunch(cookApp)
      ? await launch(cookApp)
      : throw 'Could not launch $cookApp';

  Future<void> _cookAppleAppURL() async => await canLaunch(cookAppleApp)
      ? await launch(cookAppleApp)
      : throw 'Could not launch $cookAppleApp';

  Future<void> _translateAppURL() async => await canLaunch(translateApp)
      ? await launch(translateApp)
      : throw 'Could not launch $translateApp';

  Future<void> _okGoogleApp() async => await canLaunch(okGoogleApp)
      ? await launch(okGoogleApp)
      : throw 'Could not launch $okGoogleApp';

  Future<void> _okGoogleEnglishApp() async =>
      await canLaunch(okGoogleEnglishApp)
          ? await launch(okGoogleEnglishApp)
          : throw 'Could not launch $okGoogleEnglishApp';

  Future<void> _dotURL() async => await canLaunch(dotSwordURL)
      ? await launch(dotSwordURL)
      : throw 'Could not launch $dotSwordURL';

  Future<void> _memoAppURL() async => await canLaunch(memoApp)
      ? await launch(memoApp)
      : throw 'Could not launch $memoApp';

  Future<void> _ps_memoAppURL() async => await canLaunch(psPortalApp)
      ? await launch(psPortalApp)
      : throw 'Could not launch $psPortalApp';

  Future<void> _apekAppURL() async => await canLaunch(apekApp)
      ? await launch(apekApp)
      : throw 'Could not launch $apekApp';

  Future<void> _fpsAppURL() async => await canLaunch(fpsApp)
      ? await launch(fpsApp)
      : throw 'Could not launch $fpsApp';

  Future<void> _foomAppURL() async => await canLaunch(foomApp)
      ? await launch(foomApp)
      : throw 'Could not launch $foomApp';

  Future<void> _ozisanAppURL() async => await canLaunch(ozisanApp)
      ? await launch(ozisanApp)
      : throw 'Could not launch $ozisanApp';

  Future<void> _escAppURL() async => await canLaunch(escApp)
      ? await launch(escApp)
      : throw 'Could not launch $escApp';

  Future<void> _escHospitalAppURL() async => await canLaunch(escHospitalApp)
      ? await launch(escHospitalApp)
      : throw 'Could not launch $escHospitalApp';

  Future<void> _stackBallAppURL() async => await canLaunch(stackBallApp)
      ? await launch(stackBallApp)
      : throw 'Could not launch $stackBallApp';
}
