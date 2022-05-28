import 'package:app_support_website/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DesktopServiceBody extends StatefulWidget {
  final GlobalKey serviceKey;
  final GlobalKey apekKey;
  final GlobalKey kouyakoudouKey;
  final GlobalKey escSchoolKey;
  final GlobalKey escHospitalKey;
  final GlobalKey otherGameAppKey;
  final GlobalKey translationKey;
  final GlobalKey memoKey;
  final GlobalKey okgoogleKey;

  const DesktopServiceBody(
      {Key? key,
      required this.serviceKey,
      required this.apekKey,
      required this.kouyakoudouKey,
      required this.escSchoolKey,
      required this.escHospitalKey,
      required this.otherGameAppKey,
      required this.translationKey,
      required this.memoKey,
      required this.okgoogleKey})
      : super(key: key);

  @override
  _DesktopServiceBodyState createState() => _DesktopServiceBodyState();
}

class _DesktopServiceBodyState extends State<DesktopServiceBody> {
  final controller = CarouselController();
  int activeIndex = 0;
  final img_apek = [
    'assets/app/apek_app/apek1.png',
    'assets/app/apek_app/apek2.png',
    'assets/app/apek_app/apek3.png',
    'assets/app/apek_app/apek4.png',
  ];

  final controller2 = CarouselController();
  int activeIndex2 = 0;
  final img_fps = [
    'assets/app/fps_app/fps1.png',
    'assets/app/fps_app/fps2.png',
    'assets/app/fps_app/fps3.png',
    'assets/app/fps_app/fps4.png',
  ];

  //縲繧ｯ繝?繧ｭ繝ｳ繧ｰ繧｢繝励Μhover
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
          color: Colors.white,
          child: const Text(
            'SERVICE',
            style: TextStyle(fontFamily: 'VujahdayScript', fontSize: 80),
          ),
        ),

        const SizedBox(height: 100),

        const Text(
          "システム開発",
          style: TextStyle(
              fontSize: 40, color: Colors.white, fontFamily: "sawarabi"),
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
                      color: Colors.white.withOpacity(0.3),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.7),
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
                fontSize: 40, color: Colors.white, fontFamily: "sawarabi"),
          ),
        ),

        const SizedBox(height: 100),

        buildAppURLButton(
            image: "assets/app/apek_app/apek_logo.png",
            appName: "Apek Legends(Apple Store)",
            onClick: apekIOSURL,
            ios: true,
            apple: true,
            mobile: false,
            textColor: Colors.white),

        const SizedBox(
          height: 60,
        ),

        buildAppURLButton(
            image: "assets/app/apek_app/apek_logo.png",
            appName: "Apek Legends(プレイストア)",
            onClick: apekAndroidURL,
            ios: false,
            apple: false,
            mobile: false,
            textColor: Colors.white),

        const SizedBox(
          height: 60,
        ),

        //Apek Image
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
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
        ),

        const SizedBox(
          height: 60,
        ),

        Container(
          key: widget.escHospitalKey,
          child: buildAppURLButton(
              image: "assets/app/apps_icon/esc_hospital_logo.png",
              appName: "脱出ゲーム -廃病院-(Apple Store)",
              onClick: escHospitalIOSURL,
              ios: true,
              apple: true,
              mobile: false,
              textColor: Colors.white),
        ),

        const SizedBox(
          height: 60,
        ),

        buildAppURLButton(
            image: "assets/app/apps_icon/esc_hospital_logo.png",
            appName: "脱出ゲーム -廃病院-(プレイストア)",
            onClick: escHospitalAndroidURL,
            ios: false,
            apple: false,
            mobile: false,
            textColor: Colors.white),

        const SizedBox(
          height: 60,
        ),

        // 廃病院 Image
        SizedBox(child: Image.asset("assets/app/other_game/escHospital.png")),

        const SizedBox(
          height: 60,
        ),

        Container(
          key: widget.escSchoolKey,
          child: buildAppURLButton(
              image: "assets/app/apps_icon/esc_logo.png",
              appName: "脱出ゲーム -学校-(プレイストア)",
              onClick: escSchoolAndroidURL,
              ios: false,
              apple: false,
              mobile: false,
              textColor: Colors.white),
        ),

        const SizedBox(
          height: 60,
        ),

        // 学校 Image
        SizedBox(child: Image.asset("assets/app/other_game/escSchool.png")),

        const SizedBox(height: 60),

        Container(
          key: widget.otherGameAppKey,
          child: buildAppURLButton(
              image: "assets/app/apps_icon/foom_logo.png",
              appName: "フーマの大冒険(Apple Store)",
              onClick: foomIOSURL,
              ios: true,
              apple: true,
              mobile: false,
              textColor: Colors.white),
        ),

        const SizedBox(
          height: 60,
        ),

        buildAppURLButton(
            image: "assets/app/apps_icon/foom_logo.png",
            appName: "フーマの大冒険(プレイストア)",
            onClick: foomAndroidURL,
            ios: false,
            apple: false,
            mobile: false,
            textColor: Colors.white),

        const SizedBox(
          height: 60,
        ),

        buildAppURLButton(
            image: "assets/app/apps_icon/ozisan.png",
            appName: "おじさんで積み木(プレイストア)",
            onClick: ozisanAndroidURL,
            ios: false,
            apple: false,
            mobile: false,
            textColor: Colors.white),

        const SizedBox(height: 60),

        Container(
          key: widget.kouyakoudouKey,
          child: buildAppURLButton(
              image: "assets/app/apps_icon/fps_logo.png",
              appName: "荒野行動(プレイストア)",
              onClick: fpsAndroidURL,
              ios: false,
              apple: false,
              mobile: false,
              textColor: Colors.white),
        ),

        const SizedBox(height: 60),

        buildAppURLButton(
            image: "assets/app/apps_icon/hcasual.png",
            appName: "スタックボール(プレイストア)",
            onClick: stackBallAndroidURL,
            ios: false,
            apple: false,
            mobile: false,
            textColor: Colors.white),

        const SizedBox(height: 100),

        Container(
          key: widget.translationKey,
          child: const Text(
            "アプリ開発",
            style: TextStyle(
                fontSize: 40, color: Colors.white, fontFamily: "sawarabi"),
          ),
        ),

        const SizedBox(height: 100),

        //鄙ｻ險ｳ繧｢繝励Μ ios
        // buildAppURLButton(
        //     image: "assets/translation.png",
        //     appName: "鄙ｻ險ｳ繧｢繝励Μ (iPhone逕ｨ)",
        //     onClick: _translateAppleAppURL,
        //     backColor: Colors.white,
        //     sideColor: Colors.red,
        //     textColor: Colors.blue),
        //翻訳アプリ androi
        buildAppURLButton(
            image: "assets/app/apps_icon/translation.png",
            appName: "翻訳アプリ(プレイストア)",
            onClick: translateAndroidURL,
            ios: false,
            apple: false,
            mobile: false,
            textColor: Colors.white),

        const SizedBox(height: 60),

        SizedBox(child: Image.asset("assets/app/other_game/trans.png")),

        const SizedBox(height: 60),

        Container(
          key: widget.memoKey,
          child: buildAppURLButton(
              image: "assets/app/apps_icon/memo_logo.png",
              appName: "メモ帳アプリ(プレイストア)",
              onClick: memoAndroidURL,
              ios: false,
              apple: false,
              mobile: false,
              textColor: Colors.white),
        ),

        const SizedBox(height: 60),

        SizedBox(child: Image.asset("assets/app/other_game/memo.png")),

        const SizedBox(height: 60),

        buildAppURLButton(
            image: "assets/app/apps_icon/ps_logo.png",
            appName: "パスワード管理(プレイストア)",
            onClick: psportAndroidURL,
            ios: false,
            apple: false,
            mobile: false,
            textColor: Colors.white),

        const SizedBox(height: 60),

        SizedBox(child: Image.asset("assets/app/other_game/pass.png")),

        const SizedBox(height: 60),

        //鄙ｻ險ｳ繧｢繝励Μ androi
        Container(
          key: widget.okgoogleKey,
          child: buildAppURLButton(
              image: "assets/app/apps_icon/ai_g_logo.png",
              appName: "Ok Googleさん(プレイストア)",
              onClick: okGoogleAndroidURL,
              ios: false,
              apple: false,
              mobile: false,
              textColor: Colors.white),
        ),

        const SizedBox(
          height: 60,
        ),

        //Ok Google kun androi English
        buildAppURLButton(
            image: "assets/app/apps_icon/ai_g_logo.png",
            appName: "OK Google -English版-",
            onClick: okGoogleEnglishAndroidURL,
            ios: false,
            apple: false,
            mobile: false,
            textColor: Colors.white),

        const SizedBox(height: 100),
      ],
    );
  }

  Widget buildButton() => Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.deepOrangeAccent,
                        Colors.pinkAccent,
                        Colors.yellowAccent
                      ])),
              child: IconButton(
                  onPressed: previous,
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 60,
                    color: Colors.white,
                  )),
            ),
            const Spacer(),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.deepOrangeAccent,
                        Colors.pinkAccent,
                        Colors.yellowAccent
                      ])),
              child: IconButton(
                  onPressed: next,
                  icon: const Icon(Icons.arrow_forward,
                      size: 60, color: Colors.white)),
            )
          ],
        ),
      );

  Widget buildButton2() => Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.deepOrangeAccent,
                        Colors.pinkAccent,
                        Colors.yellowAccent
                      ])),
              child: IconButton(
                  onPressed: previous2,
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 60,
                    color: Colors.white,
                  )),
            ),
            const Spacer(),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.deepOrangeAccent,
                        Colors.pinkAccent,
                        Colors.yellowAccent
                      ])),
              child: IconButton(
                  onPressed: next2,
                  icon: const Icon(Icons.arrow_forward,
                      size: 60, color: Colors.white)),
            )
          ],
        ),
      );

  void animateToSlide(int index) => controller.animateToPage(index);

  void next() => controller.nextPage(duration: const Duration(seconds: 1));

  void previous() =>
      controller.previousPage(duration: const Duration(seconds: 1));

  void animateToSlide2(int index) => controller2.animateToPage(index);

  void next2() => controller2.nextPage(duration: const Duration(seconds: 1));

  void previous2() =>
      controller2.previousPage(duration: const Duration(seconds: 1));

  Widget buildImage(String appImage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          color: Colors.black,
          width: double.infinity,
          child: Image.asset(
            appImage,
            fit: BoxFit.contain,
          )),
    );
  }
}
