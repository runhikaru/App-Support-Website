//掲示板　app
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const keizibanapp = 'https://keiziban919.web.app/#/';

//cook app (android)
const cookApp =
    'https://play.google.com/store/apps/details?id=com.genyosystem.cooking';

//cook app (ios)
const cookAppleApp = 'https://apps.apple.com/us/app/ご飯の時間/id1574334869';

//翻訳App(android)
const translateApp =
    'https://play.google.com/store/apps/details?id=com.genyosystem.translation_app';

//シンプルなメモアプリ(Android)
const memoApp =
    'https://play.google.com/store/apps/details?id=com.genyosystem.sqflite_memo';

//パスワード管�?アプリ(Android)
const psPortalApp =
    'https://play.google.com/store/apps/details?id=com.genyosystem.ps_portal_app';

//Ok Google App(android)
const okGoogleApp =
    'https://play.google.com/store/apps/details?id=com.genyosystem.variety_siri';

//Ok Google App-English (android)
const okGoogleEnglishApp =
    'https://play.google.com/store/apps/details?id=com.genyosystem.variety_ai_english';

//Apekアプリ(Android)
const apekApp =
    "https://play.google.com/store/apps/details?id=com.Genyosystem.val";

//FPSアプリ(Android)
const fpsApp =
    "https://play.google.com/store/apps/details?id=com.Genyosystem.fps";

//フーマアプリ(Android)
const foomApp = 'https://play.google.com/store/apps/details?id=com.Genyosystem';

//脱出ゲーム(Android)
const escApp =
    "https://play.google.com/store/apps/details?id=com.GenyoSystem.EscapeGame3D";

//脱出ゲーム病院(Android)
const escHospitalApp =
    "https://play.google.com/store/apps/details?id=com.GenyoSystem.eschorror";

//スタ�?クアプリ(Android)
const stackBallApp =
    'https://play.google.com/store/apps/details?id=com.Genyosystem.game';

//おじさんアプリ(Android)
const ozisanApp =
    'https://play.google.com/store/apps/details?id=com.Genyosystem.ozisan';

//ドット絵
const dotSwordURL =
    'https://drive.google.com/drive/folders/1vqYSh48ydlzINA5vslevIz2QraQe1krD?usp=sharing';

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
      colors: [
        Color.fromRGBO(100, 232, 255, 1),
        Colors.deepPurple
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}
