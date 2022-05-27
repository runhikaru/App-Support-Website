//掲示板　app
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Android App URL----------------------------------------------------------------
//Apek
const apekApp =
    "https://play.google.com/store/apps/details?id=com.Genyosystem.val";

//FPSアプリ(Android)
const fpsAppAndroid =
    "https://play.google.com/store/apps/details?id=com.Genyosystem.fps";

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

// Google Drive----------------------------------------------------------------
//ドット絵
const dotSwordURL =
    'https://drive.google.com/drive/folders/1vqYSh48ydlzINA5vslevIz2QraQe1krD?usp=sharing';

// IOS App URL----------------------------------------------------------------
//脱出ゲーム病院(IOS)
const escHospitalAppIOS =
    "https://apps.apple.com/us/app/脱出ゲーム-廃病院-くぬぎ精神病院/id1625881313";

//フーマ
const foomAppIOS = "https://apps.apple.com/us/app/モンスターフーマの冒険/id1625652187";

const desktopWidth = 800;

AppBar buildAppBar(String title) {
  return AppBar(
    elevation: 25,
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
      decoration: buildBoxDecration(0),
    ),
  );
}

BoxDecoration buildBoxDecration(double radius) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 107, 224, 253).withOpacity(.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
    gradient: const LinearGradient(
      colors: [Color.fromRGBO(100, 232, 255, 1), Colors.deepPurple],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}

BoxDecoration appButtonBoxDecration(
    double radius, Color gradC1, Color gradC2, Color shadowColor) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        color: shadowColor,
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
    gradient: LinearGradient(
      colors: [gradC1, gradC2],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}

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

// Google Drive----------------------------------------------------------------
Future<void> dotURL() async => await canLaunch(dotSwordURL)
    ? await launch(dotSwordURL)
    : throw 'Could not launch $dotSwordURL';

// Android Flutter App----------------------------------------------------------------
Future<void> translateAppAndroidURL() async =>
    await canLaunch(translateAppAndroid)
        ? await launch(translateAppAndroid)
        : throw 'Could not launch $translateAppAndroid';

Future<void> okGoogleAndroidURL() async => await canLaunch(okGoogleAppAndroid)
    ? await launch(okGoogleAppAndroid)
    : throw 'Could not launch $okGoogleAppAndroid';

Future<void> okGoogleEnglishAndroidURL() async =>
    await canLaunch(okGoogleEnglishAppAndroid)
        ? await launch(okGoogleEnglishAppAndroid)
        : throw 'Could not launch $okGoogleEnglishAppAndroid';

Future<void> memoAppAndroidURL() async => await canLaunch(memoAppAndroid)
    ? await launch(memoAppAndroid)
    : throw 'Could not launch $memoAppAndroid';

Future<void> psportAppAndroidURL() async => await canLaunch(psportAppAndroid)
    ? await launch(psportAppAndroid)
    : throw 'Could not launch $psportAppAndroid';

// IOS Game App----------------------------------------------------------------
Future<void> escHospitalAppIOSURL() async => await canLaunch(escHospitalAppIOS)
    ? await launch(escHospitalAppIOS)
    : throw 'Could not launch $escHospitalAppIOS';

    Future<void> foomAppIOSURL() async => await canLaunch(foomAppIOS)
    ? await launch(foomAppIOS)
    : throw 'Could not launch $foomAppIOS';
