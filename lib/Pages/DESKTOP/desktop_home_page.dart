import 'package:app_support_website/Pages/DESKTOP/desktop_contact_body.dart';
import 'package:app_support_website/Pages/DESKTOP/desktop_developer_body.dart';
import 'package:app_support_website/Pages/DESKTOP/desktop_pp_page.dart';
import 'package:app_support_website/Pages/DESKTOP/desktop_service_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
// import 'package:get/get.dart';
// import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({Key? key}) : super(key: key);

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  final ScrollController controllerA = ScrollController();
  final ScrollController controllerB = ScrollController();

  final serviceKey = GlobalKey();
  Future scrollToItem() async {
    final context = serviceKey.currentContext;
    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: const Duration(seconds: 1));
  }

  final apekKey = GlobalKey();
  Future scrollToItem2() async {
    final context = apekKey.currentContext;
    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: const Duration(seconds: 1));
  }

  final fpsKey = GlobalKey();
  Future scrollToItem3() async {
    final context = fpsKey.currentContext;
    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: const Duration(seconds: 1));
  }

  final escHospitalKey = GlobalKey();
  Future scrollToItem4() async {
    final context = escHospitalKey.currentContext;
    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: const Duration(seconds: 1));
  }

  final escSchoolKey = GlobalKey();
  Future scrollToItem5() async {
    final context = escSchoolKey.currentContext;
    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: const Duration(seconds: 1));
  }

  final otherGameAppKey = GlobalKey();
  Future scrollToItem6() async {
    final context = otherGameAppKey.currentContext;
    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: const Duration(seconds: 1));
  }

  final translationKey = GlobalKey();
  Future scrollToItem8() async {
    final context = translationKey.currentContext;
    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: const Duration(seconds: 1));
  }

  final memoKey = GlobalKey();
  Future scrollToItem9() async {
    final context = memoKey.currentContext;
    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: const Duration(seconds: 1));
  }

  final idKey = GlobalKey();
  Future scrollToItem13() async {
    final context = idKey.currentContext;
    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: const Duration(seconds: 1));
  }

  final okgoogleKey = GlobalKey();
  Future scrollToItem10() async {
    final context = okgoogleKey.currentContext;
    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: const Duration(seconds: 1));
  }

  final contactKey = GlobalKey();
  Future scrollToItem11() async {
    final context = contactKey.currentContext;
    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: const Duration(seconds: 1));
  }

  final developerKey = GlobalKey();
  Future scrollToItem12() async {
    final context = developerKey.currentContext;
    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    controllerA.dispose();
    controllerB.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    print(currentWidth);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 136, 199),
        elevation: 25,
        automaticallyImplyLeading: false,
        title: const Text(
          "お問い合わせ",
          style: TextStyle(
              fontFamily: 'sawarabi',
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 107, 224, 253).withOpacity(.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.to(() => const DesktopPPBody(),
                    transition: Transition.size,
                    duration: const Duration(seconds: 3));
              },
              child: const Text(
                "プライバシーポリシー",
                style: TextStyle(
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // first column
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                controller: controllerA,
                child: Column(
                  children: [
                    DesktopServiceBody(
                        serviceKey: serviceKey,
                        apekKey: apekKey,
                        fpsKey: fpsKey,
                        escSchoolKey: escSchoolKey,
                        escHospitalKey: escHospitalKey,
                        otherGameAppKey: otherGameAppKey,
                        translationKey: translationKey,
                        memoKey: memoKey,
                        idKey: idKey,
                        okgoogleKey: okgoogleKey),
                    DesktopContactBody(contactKey: contactKey),
                    DesktopDeveloperBody(
                      developerKey: developerKey,
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
                flex: 1,
                child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 41, 10, 180),
                          Color.fromARGB(255, 81, 174, 232),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: ListView(
                      controller: controllerB,
                      children: [
                        buildMenuCard(scrollToItem, "Service", 1.0, 25),
                        buildMenuCard(scrollToItem, "システム開発", 0.6, 14),
                        ScrollToItem(
                            callback: scrollToItem,
                            appName: "広告ブロック",
                            description: "Youtube広告を抹消"),
                        buildMenuCard(scrollToItem2, "ゲーム開発", 0.6, 14),
                        ScrollToItem(
                            callback: scrollToItem2,
                            appName: "Apek",
                            description: "FPS-西洋城マップ-"),
                        ScrollToItem(
                            callback: scrollToItem3,
                            appName: "荒野運動",
                            description: "空中戦-ロボ操作-"),
                        ScrollToItem(
                            callback: scrollToItem4,
                            appName: "脱出ゲーム",
                            description: "リアル3D-廃病院-"),
                        ScrollToItem(
                            callback: scrollToItem5,
                            appName: "脱出ゲーム",
                            description: "リアル3D-学校-"),
                        ScrollToItem(
                            callback: scrollToItem6,
                            appName: "ミニゲーム",
                            description: "おじさんで積み木他"),
                        buildMenuCard(scrollToItem8, "アプリ開発", 0.6, 14),
                        ScrollToItem(
                            callback: scrollToItem8,
                            appName: "翻訳アプリ",
                            description: "11カ国語を同時翻訳"),
                        ScrollToItem(
                            callback: scrollToItem13,
                            appName: "ID管理アプリ",
                            description: "仕事効率"),
                            ScrollToItem(
                            callback: scrollToItem9,
                            appName: "メモ帳アプリ",
                            description: "メモ"),
                        ScrollToItem(
                            callback: scrollToItem10,
                            appName: "Ok Google君",
                            description: "いたずらAIアプリ"),
                        buildMenuCard(scrollToItem11, "Contact", 1.0, 25),
                        ScrollToItem(
                            callback: scrollToItem11,
                            appName: "お問い合わせ",
                            description: "コンタクト"),
                        buildMenuCard(scrollToItem12, "Developer", 1.0, 25),
                        ScrollToItem(
                            callback: scrollToItem12,
                            appName: "開発者",
                            description: "私について"),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }

  Widget ScrollToItem(
      {required Callback callback,
      required String appName,
      required String description}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: callback,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 25, 29, 150).withOpacity(0.6),
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(4)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7), fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuCard(
      Callback callback, String text, double opacity, double fontSize) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: callback,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(opacity),
              borderRadius: BorderRadius.circular(4)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                  color: Colors.black.withOpacity(opacity)),
            ),
          ),
        ),
      ),
    );
  }
}