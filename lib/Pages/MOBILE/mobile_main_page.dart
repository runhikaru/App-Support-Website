import 'package:app_support_website/Pages/MOBILE/mobile_app_page.dart';
import 'package:app_support_website/Pages/MOBILE/mobile_fps_game_page.dart';
import 'package:app_support_website/Pages/MOBILE/mobile_min_game_page.dart';
import 'package:app_support_website/Pages/MOBILE/mobile_popular_game_page.dart';
import 'package:app_support_website/Pages/MOBILE/mobile_service_page.dart';
import 'package:app_support_website/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:app_support_website/Pages/MOBILE/mobile_contact_page.dart';
import 'package:app_support_website/Pages/MOBILE/mobile_developer_page.dart';
import 'package:app_support_website/Pages/MOBILE/mobile_pp_page.dart';

import 'package:get/get.dart';

class MobileMainPage extends StatelessWidget {
  final topKey = GlobalKey();
  Future scrollToItem() async {
    final context = topKey.currentContext;
    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    const drawerStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13);
    const styleSubTitle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: buildAppBar("サービス"),
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
                        transition: Transition.zoom);
                  },
                ),
                // const Divider(
                //   color: Colors.white,
                //   height: 1,
                //   thickness: 1,
                // ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    'アプリの詳細',
                    style: styleSubTitle,
                  ),
                ),
                ListTile(
                  leading:
                      const Icon(Icons.videogame_asset, color: Colors.white),
                  title: const Text(
                    '人気',
                    style: drawerStyle,
                  ),
                  onTap: () {
                    Get.to(() => const MobilePopularGamePage(),
                        transition: Transition.circularReveal,
                        duration: const Duration(seconds: 2));
                  },
                ),
                ListTile(
                  leading:
                      const Icon(Icons.sports_esports, color: Colors.white),
                  title: const Text(
                    'FPSゲーム',
                    style: drawerStyle,
                  ),
                  onTap: () {
                    Get.to(() => const MobileFPSGamePage(),
                        transition: Transition.circularReveal,
                        duration: const Duration(seconds: 2));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.games, color: Colors.white),
                  title: const Text(
                    'ミニゲーム',
                    style: drawerStyle,
                  ),
                  onTap: () {
                    Get.to(() => const MobileMinGamePage(),
                        transition: Transition.circularReveal,
                        duration: const Duration(seconds: 2));
                  },
                ),
                ListTile(
                  leading:
                      const Icon(Icons.phone_iphone_sharp, color: Colors.white),
                  title: const Text(
                    'アプリケーション',
                    style: drawerStyle,
                  ),
                  onTap: () {
                    Get.to(() => const MobileAppPage(),
                        transition: Transition.circularReveal,
                        duration: const Duration(seconds: 2));
                  },
                ),
                // const Divider(
                //   color: Colors.white,
                //   height: 1,
                //   thickness: 1,
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
                        duration: const Duration(seconds: 3));
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
                        duration: const Duration(seconds: 3));
                  },
                ),
              ],
            ),
          ),
        ),
        body: MobileServicePage(
          topKey: topKey,
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
