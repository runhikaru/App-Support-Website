import 'package:flutter/material.dart';

class DesktopDeveloperBody extends StatefulWidget {
  final GlobalKey developerKey;

  const DesktopDeveloperBody({Key? key, required this.developerKey})
      : super(key: key);

  @override
  State<DesktopDeveloperBody> createState() => _DesktopDeveloperBodyState();
}

class _DesktopDeveloperBodyState extends State<DesktopDeveloperBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //developer
        Container(
          key: widget.developerKey,
          width: double.infinity,
          height: 100,
          color: Colors.white,
          child: const Text(
            'DEVELOPER',
            style: TextStyle(
              fontFamily: 'VujahdayScript',
              fontSize: 80,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 12),
          child: Image.asset('assets/face.png'),
        ),

        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: [
            buildCard(title: "Name", description: "MIZUNO HIKARU"),
            buildCard(title: "Age", description: "21"),
            buildCard(title: "Job", description: "大学生"),
            buildCard(title: "Residence", description: "東京都八王子市"),
            buildCard(title: "アプリ・Web 開発言語", description: "Flutter"),
            buildCard(title: "ソシャゲ 開発言語", description: "C#・Unity"),
            buildCard(title: "データベース 環境", description: "FireBase・AWS"),
            buildCard(title: "セキュリティ 環境", description: "Kali Linux"),
            buildCard(title: "サウンド・ビート作曲", description: "BandLab・MPC Beat"),
          ],
        ),

        const SizedBox(height: 150),
        const Divider(
          color: Colors.white,
          thickness: 2,
        ),
        Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("(c) 2021 MHikaru inc.",
                  style: TextStyle(
                      fontSize: 13, color: Colors.white.withOpacity(0.5))),
            ))
      ],
    );
  }

  Widget buildCard({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 8),
      child: Container(
        height: 160,
        width: 300,
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
      ),
    );
  }
}
