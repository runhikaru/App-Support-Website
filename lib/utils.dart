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

//フーマ
const apekAppIOS = "https://apps.apple.com/us/app/apek-legends/id1626107035";

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
        decoration: BoxDecoration(
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
    )),
  );
}

// BoxDecoration appButtonBoxDecration(
//     double radius, Color gradC1, Color gradC2, Color shadowColor) {
//   return BoxDecoration(
//     borderRadius: BorderRadius.circular(radius),
//     boxShadow: [
//       BoxShadow(
//         color: shadowColor,
//         spreadRadius: 5,
//         blurRadius: 7,
//         offset: const Offset(0, 3), // changes position of shadow
//       ),
//     ],
//     gradient: LinearGradient(
//       colors: [gradC1, gradC2],
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//     ),
//   );
// }

Widget buildAppURLButton(
        {required String image,
        required String appName,
        required Function onClick,
        required Color gradC1,
        required Color gradC2,
        required Color shadowColor,
        required bool apple,
        required bool mobile,
        required Color textColor}) =>
    Padding(
      padding: const EdgeInsets.only(top: 20),
      child: mobile
          ? GestureDetector(
              onTap: () {
                onClick();
              },
              child: SizedBox(
                height: 80,
                width: 550,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [gradC1, gradC2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: apple
                              ? BorderRadius.circular(10.0)
                              : BorderRadius.circular(40.0),
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
                                  fontSize: 18,
                                  decoration: TextDecoration.underline)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          : OnHoverWidget(
              child: GestureDetector(
                onTap: () {
                  onClick();
                },
                child: SizedBox(
                  height: 80,
                  width: 550,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [gradC1, gradC2],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: apple
                                ? BorderRadius.circular(10.0)
                                : BorderRadius.circular(40.0),
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
                                    fontSize: 28,
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
