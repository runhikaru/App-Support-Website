//掲示板　app
import 'package:app_support_website/Widget/on_hover_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Android App URL----------------------------------------------------------------
//Apek
const apekApp =
    "https://play.google.com/store/apps/details?id=com.Genyosystem.val";

//FPSアプリ(Android)
const fpsAppAndroid =
    "https://play.google.com/store/apps/details?id=com.genyosystem.kouyakoudou";

//フーマ
const foomAppAndroid =
    'https://play.google.com/store/apps/details?id=com.Genyosystem';

//脱出ゲーム-School
const escSchoolAppAndroid =
    "https://play.google.com/store/apps/details?id=com.GenyoSystem.EscapeGame3D";

//脱出ゲーム-Hospital
const escHospitalAppAndroid =
    "https://play.google.com/store/apps/details?id=com.GenyoSystem.eschorror";

//スタックボール
const stackBallAppAndroid =
    'https://play.google.com/store/apps/details?id=com.Genyosystem.game';

//おじさんアプリ
const ozisanAppAndroid =
    'https://play.google.com/store/apps/details?id=com.Genyosystem.ozisan';

//翻訳
const translateAppAndroid =
    'https://play.google.com/store/apps/details?id=com.genyosystem.translation_app';

//シンプルなメモ
const memoAppAndroid =
    'https://play.google.com/store/apps/details?id=com.genyosystem.sqflite_memo';

//パスワード管理
const psportAppAndroid =
    'https://play.google.com/store/apps/details?id=com.genyosystem.ps_portal_app';

//Ok Google君
const okGoogleAppAndroid =
    'https://play.google.com/store/apps/details?id=com.genyosystem.variety_siri';

//Ok Google App-English
const okGoogleEnglishAppAndroid =
    'https://play.google.com/store/apps/details?id=com.genyosystem.variety_ai_english';

// IOS App URL----------------------------------------------------------------
//脱出ゲーム病院(IOS)
const escHospitalAppIOS =
    "https://apps.apple.com/us/app/脱出ゲーム-廃病院-くぬぎ精神病院/id1625881313";

//フーマ
const foomAppIOS = "https://apps.apple.com/us/app/モンスターフーマの冒険/id1625652187";

//Apek
const apekAppIOS = "https://apps.apple.com/us/app/apek-legends/id1626107035";

//翻訳
const transAppIOS =
    "https://apps.apple.com/us/app/多言語同時翻訳アプリ-コンパイル/id1627943798";

//パスワード管理
const psportAppIOS = "https://apps.apple.com/us/app/パスポータル/id1627944960";

const desktopWidth = 800;

const descriptionStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w400,
  fontFamily: 'sawarabi',
);

const webDescriptionStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w400,
  fontFamily: 'sawarabi',
);

AppBar buildAppBar(String title) {
  return AppBar(
    elevation: 25,
    backgroundColor: Color.fromARGB(255, 2, 136, 199),
    title: Text(
      title,
      style: const TextStyle(
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
      // gradient: const LinearGradient(
      //   colors: [
      //     Color.fromARGB(255, 2, 136, 199),
      //     Color.fromARGB(255, 2, 136, 199),
      //   ],
      //   begin: Alignment.centerLeft,
      //   end: Alignment.centerRight,
      // ),
    )),
  );
}

Widget buildImage(String imageName) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 20),
    child: Image.asset(
      imageName,
      fit: BoxFit.contain,
    ),
  );
}

Widget buildGooglePlayButton({
  required Function onClick,
}) =>
    Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 236, 173, 102).withOpacity(.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        width: 200,
        child: GestureDetector(
            onTap: () {
              onClick();
            },
            child: Image.asset("assets/app/play_store.png")));

Widget buildAppleStoreButton({
  required Function onClick,
}) =>
    Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 107, 224, 253).withOpacity(.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        width: 200,
        child: GestureDetector(
            onTap: () {
              onClick();
            },
            child: Image.asset("assets/app/apple_store.png")));

Widget buildAppName({required String appName, required bool isWeb}) =>
    Container(
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 107, 224, 253).withOpacity(.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 24, 203, 247),
            Color.fromARGB(255, 3, 64, 231),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          appName,
          style: TextStyle(
            fontSize: isWeb ? 40 : 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'sawarabi',
          ),
        ),
      ),
    );

// Android Game App----------------------------------------------------------------
Future<void> apekAndroidURL() async => await canLaunch(apekApp)
    ? await launch(apekApp)
    : throw 'Could not launch $apekApp';

Future<void> fpsAndroidURL() async => await canLaunch(fpsAppAndroid)
    ? await launch(fpsAppAndroid)
    : throw 'Could not launch $fpsAppAndroid';

Future<void> escSchoolAndroidURL() async => await canLaunch(escSchoolAppAndroid)
    ? await launch(escSchoolAppAndroid)
    : throw 'Could not launch $escSchoolAppAndroid';

Future<void> escHospitalAndroidURL() async =>
    await canLaunch(escHospitalAppAndroid)
        ? await launch(escHospitalAppAndroid)
        : throw 'Could not launch $escHospitalAppAndroid';

Future<void> foomAndroidURL() async => await canLaunch(foomAppAndroid)
    ? await launch(foomAppAndroid)
    : throw 'Could not launch $foomAppAndroid';

Future<void> ozisanAndroidURL() async => await canLaunch(ozisanAppAndroid)
    ? await launch(ozisanAppAndroid)
    : throw 'Could not launch $ozisanAppAndroid';

Future<void> stackBallAndroidURL() async => await canLaunch(stackBallAppAndroid)
    ? await launch(stackBallAppAndroid)
    : throw 'Could not launch $stackBallAppAndroid';

// Android Flutter App----------------------------------------------------------------
Future<void> translateAndroidURL() async => await canLaunch(translateAppAndroid)
    ? await launch(translateAppAndroid)
    : throw 'Could not launch $translateAppAndroid';

Future<void> okGoogleAndroidURL() async => await canLaunch(okGoogleAppAndroid)
    ? await launch(okGoogleAppAndroid)
    : throw 'Could not launch $okGoogleAppAndroid';

Future<void> okGoogleEnglishAndroidURL() async =>
    await canLaunch(okGoogleEnglishAppAndroid)
        ? await launch(okGoogleEnglishAppAndroid)
        : throw 'Could not launch $okGoogleEnglishAppAndroid';

Future<void> memoAndroidURL() async => await canLaunch(memoAppAndroid)
    ? await launch(memoAppAndroid)
    : throw 'Could not launch $memoAppAndroid';

Future<void> psportAndroidURL() async => await canLaunch(psportAppAndroid)
    ? await launch(psportAppAndroid)
    : throw 'Could not launch $psportAppAndroid';

// IOS Game App----------------------------------------------------------------
Future<void> escHospitalIOSURL() async => await canLaunch(escHospitalAppIOS)
    ? await launch(escHospitalAppIOS)
    : throw 'Could not launch $escHospitalAppIOS';

Future<void> foomIOSURL() async => await canLaunch(foomAppIOS)
    ? await launch(foomAppIOS)
    : throw 'Could not launch $foomAppIOS';

Future<void> apekIOSURL() async => await canLaunch(apekAppIOS)
    ? await launch(apekAppIOS)
    : throw 'Could not launch $apekAppIOS';

Future<void> transIOSURL() async => await canLaunch(transAppIOS)
    ? await launch(transAppIOS)
    : throw 'Could not launch $transAppIOS';

Future<void> psportIOSURL() async => await canLaunch(psportAppIOS)
    ? await launch(psportAppIOS)
    : throw 'Could not launch $psportAppIOS';
