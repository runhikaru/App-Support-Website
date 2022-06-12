import 'package:app_support_website/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MobileServicePage extends StatefulWidget {
  final GlobalKey topKey;
  final bool drawerOpened;

  const MobileServicePage(
      {super.key, required this.topKey, required this.drawerOpened});

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

  final controller = CarouselController();
  int activeIndex = 0;
  final img_apek = [
    'assets/app/apek_app/apek.png',
    'assets/app/apek_app/apek1.png',
    'assets/app/apek_app/apek2.png',
    'assets/app/apek_app/apek3.png',
  ];

  final controller2 = CarouselController();
  int activeIndex2 = 0;
  final img_kouya = [
    'assets/app/kouya_app/kouya1.png',
    'assets/app/kouya_app/kouya2.png',
    'assets/app/kouya_app/kouya3.png',
  ];

  final controller3 = CarouselController();
  int activeIndex3 = 0;
  final img_trans = [
    'assets/app/other_game/trans.png',
    'assets/app/other_game/trans1.png',
    'assets/app/other_game/trans2.png',
  ];

  final controller4 = CarouselController();
  int activeIndex4 = 0;
  final img_pass = [
    'assets/app/other_game/pass.png',
    'assets/app/other_game/pass2.png',
    'assets/app/other_game/pass3.png',
  ];

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      fontFamily: 'sawarabi',
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              key: widget.topKey,
              height: 40,
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "システム開発",
                style: titleStyle,
              ),
            ),

            const SizedBox(
              height: 100,
            ),

            widget.drawerOpened
                ? Container(
                    height: 230,
                    width: 490,
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 230,
                        width: 490,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
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
              height: 40,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Text("ボタンを押すと、問答無用で広告を破壊することができるようなシステムを開発！",
                  style: descriptionStyle),
            ),

            const SizedBox(
              height: 200,
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "ゲーム開発",
                style: titleStyle,
              ),
            ),

            const SizedBox(
              height: 100,
            ),

            //画象
            Stack(
              children: [
                CarouselSlider.builder(
                  carouselController: controller,
                  itemCount: img_apek.length,
                  options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2,
                      autoPlayCurve: Curves.easeInExpo,
                      autoPlayAnimationDuration: const Duration(seconds: 3),
                      // height: 270,
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

            buildAppName(appName: "Apek Legends Mobile", isWeb: false),

            const SizedBox(
              height: 40,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Text(
                  "渾身の技術を詰め込んだFPSゲーム！\n舞台は、中世ヨーロッパの城。\nロシアとベルギーのユーザーによくダウンロードされています。",
                  style: descriptionStyle),
            ),

            const SizedBox(
              height: 40,
            ),

            buildAppleStoreButton(onClick: apekIOSURL),

            const SizedBox(
              height: 40,
            ),

            buildGooglePlayButton(onClick: apekAndroidURL),

            const SizedBox(
              height: 100,
            ),

            Divider(
              thickness: 2,
              color: Colors.black26,
            ),

            const SizedBox(
              height: 100,
            ),

            //画象
            Stack(
              children: [
                CarouselSlider.builder(
                  carouselController: controller2,
                  itemCount: img_kouya.length,
                  options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2,
                      autoPlayCurve: Curves.easeInExpo,
                      autoPlayAnimationDuration: const Duration(seconds: 3),
                      // height: 270,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      reverse: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex2 = index;
                        });
                      }),
                  itemBuilder: (ctx, index, realIndex) {
                    final fpsImg = img_kouya[index];
                    return buildImage(fpsImg);
                  },
                ),
              ],
            ),

            buildAppName(appName: "荒野運動", isWeb: false),

            const SizedBox(
              height: 40,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Text("空中移動も自由自在！\nロボットの操縦や個性的な武器の数々！\n廃城で敵を殲滅せよ",
                  style: descriptionStyle),
            ),

            const SizedBox(
              height: 40,
            ),

            buildGooglePlayButton(onClick: fpsAndroidURL),

            const SizedBox(
              height: 100,
            ),

            Divider(
              thickness: 2,
              color: Colors.black26,
            ),

            const SizedBox(
              height: 100,
            ),

            SizedBox(
                height: 270,
                child: Image.asset("assets/app/other_game/escHospital.png")),

            const SizedBox(
              height: 40,
            ),

            buildAppName(appName: "脱出ゲーム-廃病院-", isWeb: false),

            const SizedBox(
              height: 40,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Text("ダウンロード数3000突破！\n廃墟の精神病院からの脱出ゲーム！",
                  style: descriptionStyle),
            ),

            const SizedBox(
              height: 40,
            ),

            buildAppleStoreButton(onClick: escHospitalIOSURL),

            const SizedBox(
              height: 40,
            ),

            buildGooglePlayButton(onClick: escHospitalAndroidURL),

            const SizedBox(
              height: 100,
            ),

            Divider(
              thickness: 2,
              color: Colors.black26,
            ),

            const SizedBox(
              height: 100,
            ),

            SizedBox(
                height: 270,
                child: Image.asset("assets/app/other_game/escPc.png")),

            const SizedBox(
              height: 40,
            ),

            buildAppName(appName: "脱出ゲーム-パソコンからの脱出-", isWeb: false),

            const SizedBox(
              height: 40,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Text("パソコンの中に閉じ込められるというSF的、脱出ゲーム",
                  style: descriptionStyle),
            ),

            const SizedBox(
              height: 40,
            ),

            buildAppleStoreButton(onClick: escPCtIOSURL),

            const SizedBox(
              height: 100,
            ),

            Divider(
              thickness: 2,
              color: Colors.black26,
            ),

            const SizedBox(
              height: 100,
            ),
            SizedBox(
                height: 270,
                child: Image.asset("assets/app/other_game/escSchool.png")),

            const SizedBox(
              height: 40,
            ),

            buildAppName(appName: "脱出ゲーム-学校-", isWeb: false),

            const SizedBox(
              height: 40,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child:
                  Text("ダウンロード数1000突破！\n学校からの脱出ゲーム！", style: descriptionStyle),
            ),

            const SizedBox(
              height: 40,
            ),

            buildGooglePlayButton(onClick: escSchoolAndroidURL),

            const SizedBox(
              height: 100,
            ),

            Divider(
              thickness: 2,
              color: Colors.black26,
            ),

            const SizedBox(
              height: 100,
            ),

            SizedBox(
                height: 270,
                child: Image.asset("assets/app/other_game/foom.png")),

            const SizedBox(
              height: 40,
            ),

            buildAppName(appName: "モンスターフーマの冒険", isWeb: false),

            const SizedBox(
              height: 40,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Text("ふざけたゲームです。", style: descriptionStyle),
            ),

            const SizedBox(
              height: 40,
            ),

            buildAppleStoreButton(onClick: foomIOSURL),

            const SizedBox(
              height: 40,
            ),

            buildGooglePlayButton(onClick: foomAndroidURL),

            const SizedBox(
              height: 100,
            ),

            Divider(
              thickness: 2,
              color: Colors.black26,
            ),

            const SizedBox(
              height: 100,
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "スマホアプリ開発",
                style: titleStyle,
              ),
            ),

            const SizedBox(
              height: 100,
            ),

            const SizedBox(
              height: 40,
            ),

            //画象
            Stack(
              children: [
                CarouselSlider.builder(
                  carouselController: controller,
                  itemCount: img_trans.length,
                  options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2,
                      autoPlayCurve: Curves.easeInExpo,
                      autoPlayAnimationDuration: const Duration(seconds: 3),
                      // height: 270,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      reverse: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      }),
                  itemBuilder: (ctx, index, realIndex) {
                    final transImg = img_trans[index];
                    return buildImage(transImg);
                  },
                ),
              ],
            ),

            buildAppName(appName: "翻訳アプリ", isWeb: false),

            const SizedBox(
              height: 40,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Text("11ヶ国語を一度に翻訳し、発音も聞けるアプリです。", style: descriptionStyle),
            ),

            const SizedBox(
              height: 40,
            ),

            buildAppleStoreButton(onClick: transIOSURL),

            const SizedBox(
              height: 40,
            ),

            buildGooglePlayButton(onClick: translateAndroidURL),

            const SizedBox(
              height: 100,
            ),

            Divider(
              thickness: 2,
              color: Colors.black26,
            ),

            const SizedBox(
              height: 100,
            ),

            //画象
            Stack(
              children: [
                CarouselSlider.builder(
                  carouselController: controller2,
                  itemCount: img_pass.length,
                  options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2,
                      autoPlayCurve: Curves.easeInExpo,
                      autoPlayAnimationDuration: const Duration(seconds: 3),
                      // height: 270,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      reverse: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex2 = index;
                        });
                      }),
                  itemBuilder: (ctx, index, realIndex) {
                    final fpsImg = img_pass[index];
                    return buildImage(fpsImg);
                  },
                ),
              ],
            ),

            buildAppName(appName: "パスワード管理アプリ", isWeb: false),

            const SizedBox(
              height: 40,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Text("増えたログインIDやパスワードをメモ！\nコピペで使うことができるアプリです。",
                  style: descriptionStyle),
            ),

            const SizedBox(
              height: 40,
            ),

            buildAppleStoreButton(onClick: psportIOSURL),

            const SizedBox(
              height: 40,
            ),

            buildGooglePlayButton(onClick: psportAndroidURL),

            const SizedBox(
              height: 100,
            ),

            Divider(
              thickness: 2,
              color: Colors.black26,
            ),

            const SizedBox(
              height: 100,
            ),

            SizedBox(
                height: 270,
                child: Image.asset("assets/app/other_game/memo.png")),

            const SizedBox(
              height: 40,
            ),

            buildAppName(appName: "シンプルなメモ帳", isWeb: false),

            const SizedBox(
              height: 40,
            ),

            buildGooglePlayButton(onClick: memoAndroidURL),

            const SizedBox(
              height: 100,
            ),

            Divider(
              thickness: 2,
              color: Colors.black26,
            ),

            const SizedBox(
              height: 100,
            ),

            buildAppName(appName: "Ok Googleくん", isWeb: false),

            const SizedBox(
              height: 40,
            ),

            //Ok Google kun androi
            buildGooglePlayButton(onClick: okGoogleAndroidURL),

            const SizedBox(height: 200),

            const Divider(
              color: Colors.black26,
              thickness: 2,
            ),

            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text("(c) 2021 MHikaru inc.",
                      style: TextStyle(
                          fontSize: 13, color: Colors.black.withOpacity(0.5))),
                ))
          ],
        ),
      ),
    );
  }
}
