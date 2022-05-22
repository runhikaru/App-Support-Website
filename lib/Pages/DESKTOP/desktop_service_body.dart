import 'package:app_support_website/Widget/on_hover_widget.dart';
import 'package:app_support_website/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  final controller3 = CarouselController();
  int activeIndex3 = 0;
  final img_escHospital = [
    'assets/app/fps_app/fps1.png',
    'assets/app/fps_app/fps2.png',
    'assets/app/fps_app/fps3.png',
    'assets/app/fps_app/fps4.png',
  ];

  final controller4 = CarouselController();
  int activeIndex4 = 0;
  final img_escSchool = [
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

        buildAppLink(
            image: "assets/app/apek_app/apek_logo.png",
            appName: "Apek Legends(Playストア)",
            onClick: _apekAppURL,
            backColor: Colors.blue,
            sideColor: Colors.white,
            textColor: Colors.white),

        const SizedBox(
          height: 60,
        ),

        const SizedBox(height: 60),

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
          child: buildAppLink(
              image: "assets/app/apps_icon/esc_hospital_logo.png",
              appName: "脱出ゲーム -廃病院-(Playストア)",
              onClick: _escHospitalAppURL,
              backColor: Colors.blue,
              sideColor: Colors.white,
              textColor: Colors.white),
        ),

        const SizedBox(
          height: 60,
        ),

        // 廃病院 Image
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              CarouselSlider.builder(
                carouselController: controller3,
                itemCount: img_escHospital.length,
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
                        activeIndex3 = index;
                      });
                    }),
                itemBuilder: (ctx, index, realIndex) {
                  final escHospitalImg = img_escHospital[index];
                  return buildImage(escHospitalImg);
                },
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 60,
        ),

        Container(
          key: widget.escSchoolKey,
          child: buildAppLink(
              image: "assets/app/apps_icon/esc_logo.png",
              appName: "脱出ゲーム -学校-(Playストア)",
              onClick: _escAppURL,
              backColor: Colors.blue,
              sideColor: Colors.white,
              textColor: Colors.white),
        ),

        const SizedBox(
          height: 60,
        ),

        // 学校 Image
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              CarouselSlider.builder(
                carouselController: controller4,
                itemCount: img_escSchool.length,
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
                        activeIndex4 = index;
                      });
                    }),
                itemBuilder: (ctx, index, realIndex) {
                  final escSchoolImg = img_escSchool[index];
                  return buildImage(escSchoolImg);
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 60),

        Container(
          key: widget.otherGameAppKey,
          child: buildAppLink(
              image: "assets/app/apps_icon/foom_logo.png",
              appName: "フーマの大冒険(Playストア)",
              onClick: _foomAppURL,
              backColor: Colors.blue,
              sideColor: Colors.white,
              textColor: Colors.white),
        ),

        const SizedBox(
          height: 60,
        ),

        buildAppLink(
            image: "assets/app/apps_icon/ozisan.png",
            appName: "おじさんで積み木(Playストア)",
            onClick: _ozisanAppURL,
            backColor: Colors.blue,
            sideColor: Colors.white,
            textColor: Colors.white),

        const SizedBox(height: 60),

        Container(
          key: widget.kouyakoudouKey,
          child: buildAppLink(
              image: "assets/app/apps_icon/fps_logo.png",
              appName: "荒野行動(Playストア)",
              onClick: _fpsAppURL,
              backColor: Colors.blue,
              sideColor: Colors.white,
              textColor: Colors.white),
        ),

        const SizedBox(height: 60),

        buildAppLink(
            image: "assets/app/apps_icon/hcasual.png",
            appName: "スタックボール(Playストア)",
            onClick: _ozisanAppURL,
            backColor: Colors.blue,
            sideColor: Colors.white,
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
        // buildAppLink(
        //     image: "assets/translation.png",
        //     appName: "鄙ｻ險ｳ繧｢繝励Μ (iPhone逕ｨ)",
        //     onClick: _translateAppleAppURL,
        //     backColor: Colors.white,
        //     sideColor: Colors.red,
        //     textColor: Colors.blue),
        //翻訳アプリ androi
        buildAppLink(
            image: "assets/app/apps_icon/translation.png",
            appName: "翻訳アプリ(Playストア)",
            onClick: _translateAppURL,
            backColor: const Color.fromARGB(95, 242, 58, 207),
            sideColor: Colors.white,
            textColor: Colors.white),

        Container(
          key: widget.memoKey,
          child: buildAppLink(
              image: "assets/app/apps_icon/memo_logo.png",
              appName: "メモ帳アプリ(Playストア)",
              onClick: _memoAppURL,
              backColor: Colors.blue,
              sideColor: Colors.white,
              textColor: Colors.white),
        ),

        const SizedBox(height: 60),

        buildAppLink(
            image: "assets/app/apps_icon/ps_logo.png",
            appName: "パスワード管理(Playストア)",
            onClick: _ps_memoAppURL,
            backColor: Colors.blue,
            sideColor: Colors.white,
            textColor: Colors.white),

        const SizedBox(height: 60),

        //鄙ｻ險ｳ繧｢繝励Μ androi
        Container(
          key: widget.okgoogleKey,
          child: buildAppLink(
              image: "assets/app/apps_icon/ai_g_logo.png",
              appName: "Ok Googleさん(Playストア)",
              onClick: _okGoogleApp,
              backColor: Colors.blue,
              sideColor: Colors.white,
              textColor: Colors.white),
        ),

        const SizedBox(
          height: 60,
        ),

        //Ok Google kun androi English
        buildAppLink(
            image: "assets/app/apps_icon/ai_g_logo.png",
            appName: "OK Google -English版-",
            onClick: _okGoogleEnglishApp,
            backColor: Colors.blue,
            sideColor: Colors.white,
            textColor: Colors.white),

        // const SizedBox(height: 100),

        // const Text(
        //   "音源制作",
        //   style: TextStyle(
        //       fontSize: 40, color: Colors.white, fontFamily: "sawarabi"),
        // ),

        // const SizedBox(height: 100),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     Column(
        //       children: [
        //         Container(
        //           height: 180,
        //           width: 320,
        //           child: YoutubePlayerControllerProvider(
        //             controller: _controller4,
        //             child: const YoutubePlayerIFrame(
        //               aspectRatio: 16 / 9,
        //             ),
        //           ),
        //         ),
        //         const Text(
        //           "[Free] The Lightning Core",
        //           style: TextStyle(
        //               fontFamily: "shadows",
        //               fontSize: 18,
        //               fontWeight: FontWeight.bold),
        //         )
        //       ],
        //     ),
        //     Column(
        //       children: [
        //         Container(
        //           height: 180,
        //           width: 320,
        //           child: YoutubePlayerControllerProvider(
        //             controller: _controller5,
        //             child: const YoutubePlayerIFrame(
        //               aspectRatio: 16 / 9,
        //             ),
        //           ),
        //         ),
        //         const Text(
        //           "[Free] The Lightning Core",
        //           style: TextStyle(
        //               fontFamily: "shadows",
        //               fontSize: 18,
        //               fontWeight: FontWeight.bold),
        //         )
        //       ],
        //     ),
        //   ],
        // ),

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

  Widget buildAppLink(
          {required String image,
          required String appName,
          required Function onClick,
          required Color backColor,
          required Color sideColor,
          required Color textColor}) =>
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: OnHoverWidget(
          child: GestureDetector(
            onTap: () {
              onClick();
            },
            child: SizedBox(
              height: 80,
              width: 550,
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
                                fontSize: 20,
                                decoration: TextDecoration.underline)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
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

  void _cookAppURL() async => await canLaunch(cookApp)
      ? await launch(cookApp)
      : throw 'Could not launch $cookApp';

  void _cookAppleAppURL() async => await canLaunch(cookAppleApp)
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

  // void _chatAppURL() async => await canLaunch(chatApp)
  //     ? await launch(chatApp)
  //     : throw 'Could not launch $chatApp';

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
