import 'package:app_support_website/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DesktopServiceBody extends StatefulWidget {
  final GlobalKey serviceKey;
  final GlobalKey apekKey;
  final GlobalKey fpsKey;
  final GlobalKey escSchoolKey;
  final GlobalKey escHospitalKey;
  final GlobalKey otherGameAppKey;
  final GlobalKey translationKey;
  final GlobalKey memoKey;
  final GlobalKey idKey;
  final GlobalKey okgoogleKey;

  const DesktopServiceBody(
      {Key? key,
      required this.serviceKey,
      required this.apekKey,
      required this.fpsKey,
      required this.escSchoolKey,
      required this.escHospitalKey,
      required this.otherGameAppKey,
      required this.translationKey,
      required this.memoKey,
      required this.idKey,
      required this.okgoogleKey})
      : super(key: key);

  @override
  _DesktopServiceBodyState createState() => _DesktopServiceBodyState();
}

class _DesktopServiceBodyState extends State<DesktopServiceBody> {
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

  //hover
  BorderRadius? border;
  Color? color;
  double? height;
  double? width;
  bool? animate;
  bool? textAppear;

  @override
  void initState() {
    super.initState();

    animate = false;
    textAppear = false;
    changer(animate!);
  }

  void changer(bool a) {
    setState(() {
      if (a) {
        height = 400;
        width = 700;
        color = const Color(0xff004b93);
        border = BorderRadius.circular(40);
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            textAppear = true;
          });
        });
      } else {
        height = 370;
        width = 370;
        color = Colors.red[700];
        border = BorderRadius.circular(300);
      }
    });
  }

  final namefocus = FocusNode();
  final agefocus = FocusNode();

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'RJsoKYYhvcM',
    params: const YoutubePlayerParams(
        startAt: Duration(seconds: 0),
        showControls: true,
        showFullscreenButton: true,
        autoPlay: false),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Service
        Container(
          key: widget.serviceKey,
          width: double.infinity,
          height: 100,
          color: Colors.black,
          child: const Text(
            'SERVICE',
            style: TextStyle(
              fontFamily: 'VujahdayScript',
              fontSize: 80,
              color: Colors.white,
            ),
          ),
        ),

        const SizedBox(height: 100),

        const Text(
          "システム開発",
          style: TextStyle(
              fontSize: 60,
              fontFamily: "sawarabi",
              fontWeight: FontWeight.bold),
        ),

        //Youtube Ad Block Youtube
        MouseRegion(
          onEnter: (a) {
            setState(() {
              animate = true;
              changer(animate!);
            });
          },
          onExit: (a) {
            setState(() {
              animate = false;
              changer(animate!);
              textAppear = false;
            });
          },
          child: SizedBox(
            height: 630,
            width: 580,
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(0, 0),
                  child: AnimatedContainer(
                    height: height!,
                    width: width!,
                    duration: const Duration(milliseconds: 350),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),
                    decoration: BoxDecoration(
                      borderRadius: border!,
                      color: Colors.black.withOpacity(0.3),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    child: AnimatedOpacity(
                      opacity: textAppear! ? 1 : 0,
                      duration: Duration(milliseconds: textAppear! ? 400 : 400),
                      curve: Curves.easeOut,
                      child: ListView(
                        children: [
                          YoutubePlayerControllerProvider(
                            controller: _controller,
                            child: const YoutubePlayerIFrame(
                              aspectRatio: 16 / 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 270),
                    height: animate! ? 0 : 450,
                    width: animate! ? 0 : 450,
                    child: const Image(
                      image: AssetImage(
                          'assets/app/youtube_icon/youtube_block.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        Container(
          key: widget.apekKey,
          child: const Text(
            "ゲーム開発",
            style: TextStyle(
                fontSize: 60,
                fontFamily: "sawarabi",
                fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(height: 100),

        //Apek Image
        Stack(
          children: [
            CarouselSlider.builder(
              carouselController: controller,
              itemCount: img_apek.length,
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2,
                  autoPlayCurve: Curves.easeInExpo,
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

        buildAppName(appName: "Apek Legends Mobile", isWeb: false),

        const SizedBox(
          height: 60,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Text(
              "渾身の技術を詰め込んだFPSゲーム！\n舞台は、中世ヨーロッパの城。\nロシアとベルギーのユーザーによくダウンロードされています。",
              style: webDescriptionStyle),
        ),

        const SizedBox(
          height: 60,
        ),

        buildAppleStoreButton(onClick: apekIOSURL),

        const SizedBox(
          height: 60,
        ),

        buildGooglePlayButton(onClick: apekAndroidURL),

        const SizedBox(
          height: 250,
        ),

        //荒野 Image
        Container(
          key: widget.fpsKey,
          child: Stack(
            children: [
              CarouselSlider.builder(
                carouselController: controller4,
                itemCount: img_kouya.length,
                options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2,
                    autoPlayCurve: Curves.easeInExpo,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    height: 400,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    reverse: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex4 = index;
                      });
                    }),
                itemBuilder: (ctx, index, realIndex) {
                  final kouyaImg = img_kouya[index];
                  return buildImage(kouyaImg);
                },
              ),
            ],
          ),
        ),

        buildAppName(appName: "荒野運動", isWeb: false),

        const SizedBox(
          height: 60,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Text("空中移動も自由自在！\nロボットの操縦や個性的な武器の数々！\n廃城で敵を殲滅せよ",
              style: webDescriptionStyle),
        ),

        const SizedBox(
          height: 60,
        ),

        buildGooglePlayButton(onClick: fpsAndroidURL),

        const SizedBox(
          height: 250,
        ),

        // 廃病院 Image
        Container(
            key: widget.escHospitalKey,
            height: 400,
            child: Image.asset("assets/app/other_game/escHospital.png")),

        const SizedBox(
          height: 60,
        ),

        buildAppName(appName: "脱出ゲーム-廃病院-", isWeb: false),

        const SizedBox(
          height: 60,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child:
              Text("ダウンロード数3000突破！\n廃墟の精神病院からの脱出ゲーム！", style: webDescriptionStyle),
        ),

        const SizedBox(
          height: 60,
        ),

        buildAppleStoreButton(onClick: escHospitalIOSURL),

        const SizedBox(
          height: 60,
        ),

        buildGooglePlayButton(onClick: escHospitalAndroidURL),

        const SizedBox(
          height: 250,
        ),

        // 学校 Image
        Container(
            key: widget.escSchoolKey,
            height: 400,
            child: Image.asset("assets/app/other_game/escSchool.png")),

        const SizedBox(
          height: 60,
        ),

        buildAppName(appName: "脱出ゲーム-学校-", isWeb: false),

        const SizedBox(
          height: 60,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Text("ダウンロード数1000突破！\n学校からの脱出ゲーム！", style: webDescriptionStyle),
        ),

        const SizedBox(
          height: 60,
        ),

        buildGooglePlayButton(onClick: escSchoolAndroidURL),

        const SizedBox(height: 250),

        Container(
            key: widget.otherGameAppKey,
            height: 400,
            child: Image.asset("assets/app/other_game/foom.png")),

        const SizedBox(
          height: 60,
        ),

        buildAppName(appName: "モンスターフーマの冒険", isWeb: false),

        const SizedBox(
          height: 60,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Text("ふざけたゲームです。", style: webDescriptionStyle),
        ),

        const SizedBox(
          height: 60,
        ),

        buildAppleStoreButton(onClick: foomIOSURL),

        const SizedBox(
          height: 60,
        ),

        buildGooglePlayButton(onClick: foomAndroidURL),

        const SizedBox(height: 250),

        Container(
          key: widget.translationKey,
          child: const Text(
            "アプリ開発",
            style: TextStyle(
                fontSize: 60,
                fontFamily: "sawarabi",
                fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(height: 100),

        //Translation Image
        Stack(
          children: [
            CarouselSlider.builder(
              carouselController: controller2,
              itemCount: img_trans.length,
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2,
                  autoPlayCurve: Curves.easeInExpo,
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
                final transImg = img_trans[index];
                return buildImage(transImg);
              },
            ),
          ],
        ),

        buildAppName(appName: "翻訳アプリ", isWeb: false),

        const SizedBox(
          height: 60,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Text("11ヶ国語を一度に翻訳し、発音も聞けるアプリです。", style: webDescriptionStyle),
        ),

        const SizedBox(
          height: 60,
        ),

        buildAppleStoreButton(onClick: transIOSURL),

        const SizedBox(
          height: 60,
        ),

        buildGooglePlayButton(onClick: translateAndroidURL),

        const SizedBox(height: 250),

        //画象
        Container(
          key: widget.idKey,
          child: Stack(
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
        ),

        buildAppName(appName: "パスワード管理アプリ", isWeb: false),

        const SizedBox(
          height: 60,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Text("増えたログインIDやパスワードをメモ！\nコピペで使うことができるアプリです。",
              style: webDescriptionStyle),
        ),

        const SizedBox(
          height: 60,
        ),

        buildAppleStoreButton(onClick: psportIOSURL),

        const SizedBox(
          height: 60,
        ),

        buildGooglePlayButton(onClick: psportAndroidURL),

        const SizedBox(height: 250),

        Container(
            key: widget.memoKey,
            height: 400,
            child: Image.asset("assets/app/other_game/memo.png")),

        const SizedBox(
          height: 60,
        ),

        buildAppName(appName: "シンプルなメモ帳", isWeb: false),

        const SizedBox(
          height: 60,
        ),

        buildGooglePlayButton(onClick: memoAndroidURL),

        const SizedBox(height: 250),

        Container(
            key: widget.okgoogleKey,
            child: buildAppName(appName: "Ok Googleくん", isWeb: false)),

        const SizedBox(
          height: 60,
        ),

        //Ok Google kun androi
        buildGooglePlayButton(onClick: okGoogleAndroidURL),

        const SizedBox(height: 200),

        const SizedBox(height: 250),
      ],
    );
  }
}
