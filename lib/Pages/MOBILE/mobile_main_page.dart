import 'package:app_support_website/Pages/MOBILE/mobile_service_page.dart';
import 'package:app_support_website/utils.dart';
import 'package:flutter/material.dart';
import 'package:app_support_website/Pages/MOBILE/mobile_contact_page.dart';
import 'package:app_support_website/Pages/MOBILE/mobile_developer_page.dart';
import 'package:app_support_website/Pages/MOBILE/mobile_pp_page.dart';

import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MobileMainPage extends StatefulWidget {
  @override
  State<MobileMainPage> createState() => _MobileMainPageState();
}

class _MobileMainPageState extends State<MobileMainPage> {
  bool drawerOpened = false;

  final topKey = GlobalKey();

  Future scrollToItem() async {
    final context = topKey.currentContext;
    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: const Duration(seconds: 2));
  }

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
    const drawerStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13);
    const styleSubTitle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16);

    return SafeArea(
      child: Scaffold(
        onEndDrawerChanged: ((isOpened) {
          setState(() {
            print(isOpened);
            drawerOpened = isOpened;
          });
        }),

        //AppBar
        appBar: buildAppBar("サービス"),

        //Drawer
        endDrawer: SizedBox(
          width: double.infinity,
          child: Drawer(
            elevation: 30,
            backgroundColor: const Color.fromARGB(255, 2, 136, 199),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'メニュー',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 1,
                  thickness: 1,
                ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    'お問い合わせ',
                    style: styleSubTitle,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.mail, color: Colors.white),
                  title: const Text(
                    'コンタクト',
                    style: drawerStyle,
                  ),
                  onTap: () {
                    Get.to(() => const MobileContactPage(),
                        transition: Transition.size,
                        duration: const Duration(milliseconds: 1500));
                  },
                ),
                // const Padding(
                //   padding: EdgeInsets.all(6.0),
                //   child: Text(
                //     'アプリの詳細',
                //     style: styleSubTitle,
                //   ),
                // ),
                // ListTile(
                //   leading:
                //       const Icon(Icons.videogame_asset, color: Colors.white),
                //   title: const Text(
                //     'Unity',
                //     style: drawerStyle,
                //   ),
                //   onTap: () {
                //     Get.to(() => const MobileUnityPage(),
                //         transition: Transition.size,
                //         duration: const Duration(milliseconds: 1500));
                //   },
                // ),
                // ListTile(
                //   leading:
                //       const Icon(Icons.sports_esports, color: Colors.white),
                //   title: const Text(
                //     'Flutter',
                //     style: drawerStyle,
                //   ),
                //   onTap: () {
                //     Get.to(() => const MobileFlutterPage(),
                //         transition: Transition.size,
                //         duration: const Duration(milliseconds: 1500));
                //   },
                // ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    'その他',
                    style: styleSubTitle,
                  ),
                ),
                ListTile(
                  leading:
                      const Icon(Icons.account_circle, color: Colors.white),
                  title: const Text(
                    '開発者について',
                    style: drawerStyle,
                  ),
                  onTap: () {
                    Get.to(() => const MobileDeveloperPage(),
                        transition: Transition.leftToRightWithFade,
                        duration: const Duration(seconds: 2));
                  },
                ),
                ListTile(
                  leading:
                      const Icon(Icons.privacy_tip_sharp, color: Colors.white),
                  title: const Text(
                    'プライバシーポリシー',
                    style: drawerStyle,
                  ),
                  onTap: () {
                    Get.to(() => const MobilePPPage(),
                        transition: Transition.leftToRightWithFade,
                        duration: const Duration(seconds: 2));
                  },
                ),
              ],
            ),
          ),
        ),

        body: MobileServicePage(
          topKey: topKey,
          drawerOpened: drawerOpened,
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white.withOpacity(0.2),
          onPressed: scrollToItem,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.upload, color: Colors.white.withOpacity(0.5)),
              Text(
                "TOP",
                style: TextStyle(
                    fontSize: 13, color: Colors.white.withOpacity(0.5)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}