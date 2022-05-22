import 'package:app_support_website/utils.dart';
import 'package:flutter/material.dart';

class MobileDeveloperPage extends StatefulWidget {
  const MobileDeveloperPage({Key? key}) : super(key: key);

  @override
  _MobileDeveloperPageState createState() => _MobileDeveloperPageState();
}

class _MobileDeveloperPageState extends State<MobileDeveloperPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: buildAppBar("開発者"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Image.asset(
                      'assets/face.png',
                    ),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    buildCard(
                        title: "Name",
                        description: "MIZUNO HIKARU",
                        right: false),
                    buildCard(title: "Age", description: "21", right: true),
                    buildCard(title: "Job", description: "大学生", right: false),
                    buildCard(
                        title: "Residence",
                        description: "東京都八王子市",
                        right: true),
                    buildCard(
                        title: "アプリ・Web 開発言語",
                        description: "Flutter",
                        right: false),
                    buildCard(
                        title: "ソシャゲ 開発言語",
                        description: "C#・Unity",
                        right: true),
                    buildCard(
                        title: "データベース 環境",
                        description: "FireBase・AWS",
                        right: false),
                    buildCard(
                        title: "セキュリティ 環境",
                        description: "Kali Linux",
                        right: true),
                    buildCard(
                        title: "サウンド・ビート作曲",
                        description: "BandLab・MPC Beat",
                        right: false),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(
      {required String title,
      required String description,
      required bool right}) {
    bool bikSize = false;
    final currentWidth = MediaQuery.of(context).size.width;
    print(currentWidth);
    if (currentWidth >= 618) {
      bikSize = true;
    }
    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 8),
      child: bikSize
          ? Container(
              height: 140,
              width: 280,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                border: Border.all(
                  color: Colors.white.withOpacity(0.7),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white54, fontSize: 20),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 28),
                  ),
                ],
              ),
            )
          : Align(
              alignment: right ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                height: 140,
                width: 280,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.7),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style:
                          const TextStyle(color: Colors.white54, fontSize: 20),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 28),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
