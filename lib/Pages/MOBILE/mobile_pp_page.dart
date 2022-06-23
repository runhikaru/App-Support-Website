import 'package:app_support_website/utils.dart';
import 'package:flutter/material.dart';

class MobilePPPage extends StatefulWidget {
  const MobilePPPage({Key? key}) : super(key: key);

  @override
  _MobilePPPageState createState() => _MobilePPPageState();
}

class _MobilePPPageState extends State<MobilePPPage> {
  @override
  Widget build(BuildContext context) {
    const style2 = TextStyle(color: Colors.white70);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: buildAppBar("情報保護方針"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //見出し
                const Text(
                  "当アプリは、お客様の個人情報は、当アプリへの信頼のもとお客様が自らの意志により特定の目的での利用のために当アプリに預託されたものであり、この個人情報を安全に保管し、お客様の意志を尊重して利用することが、当アプリに課せられた最大の課題であると認識しております。\n当アプリは、個人情報に関する法令を遵守し、個人情報の適切な取り扱いを実現致します。",
                  style: style2,
                ),
                //小見出し
                buildHead(
                    icon: const Icon(
                      Icons.local_police_outlined,
                      color: Colors.lightBlue,
                    ),
                    head: "個人情報の取得について"),
                //本文
                buildText("当アプリは、偽りその他不正の手段によらず適正に個人情報を取得致します。"),
                //見出し
                buildHead(
                    icon: const Icon(
                      Icons.local_police_outlined,
                      color: Colors.lightBlue,
                    ),
                    head: "個人情報の利用について"),
                //本文
                buildText(
                  "当アプリは、利用目的を出来る限り限定した上で、あらかじめご本人の同意を得た場合、および法令により例外と認められた場合を除き、明示または公表した利用目的の範囲内でのみ個人情報を取り扱います。",
                ),
                //見出し
                buildHead(
                    icon: const Icon(
                      Icons.local_police_outlined,
                      color: Colors.lightBlue,
                    ),
                    head: "個人情報の安全管理について"),
                //本文
                buildText(
                  "当アプリは、取り扱う個人情報の漏洩、滅失またはき損の防止その他の個人情報の安全管理のために必要かつ適切な措置を講じます。",
                ),
                //見出し
                buildHead(
                    icon: const Icon(
                      Icons.local_police_outlined,
                      color: Colors.lightBlue,
                    ),
                    head: "個人情報の委託について"),
                //本文
                buildText(
                  "当アプリは、個人情報の取り扱いの全部または一部を第三者に委託する場合は、当該第三者について厳正な調査を行い、取り扱いを委託された個人情報の安全管理が図られるよう当該第三者に対する必要かつ適切な監督を行います。",
                ),
                //見出し
                buildHead(
                    icon: const Icon(
                      Icons.local_police_outlined,
                      color: Colors.lightBlue,
                    ),
                    head: "個人情報の第三者提供について"),
                //本文
                buildText(
                  "当アプリは、個人情報保護法等の法令に定めのある場合を除き、個人情報をあらかじめご本人の同意を得ることなく、第三者に提供致しません。",
                ),
                //見出し
                buildHead(
                    icon: const Icon(
                      Icons.local_police_outlined,
                      color: Colors.lightBlue,
                    ),
                    head: "個人情報の開示・訂正などに\nついて"),
                //本文
                buildText(
                  "当アプリは、ご本人から自己の個人情報についての開示の請求がある場合、速やかに開示を致します。\nその際、ご本人であることが確認できない場合には、開示に応じません。\n個人情報の内容に誤りがあり、ご本人から訂正・追加・削除の請求がある場合、調査の上、速やかにこれらの請求に対応致します。\nその際、ご本人であることが確認できない場合には、これらの請求に応じません。",
                ),
                //見出し
                buildHead(
                    icon: const Icon(
                      Icons.local_police_outlined,
                      color: Colors.lightBlue,
                    ),
                    head: "スマホ用アプリケーション\nにおけるポリシーについて"),
                //本文
                buildText(
                  "当アプリは、提供するスマートフォン用アプリケーションを通じてユーザーの個人情報（氏名、電話番号、写真データ、音声データ、顔の特徴等）を取得することはありません。\nまた、ユーザーの写真またはカメラ機能を使用する当アプリケーションは、ユーザーのスマートフォン端末内でのみ写真データの処理を行います。当アプリケーションが、当アプリを含む第三者に対して、当該写真データを送信することはありません。",
                ),
                //見出し
                buildHead(
                    icon: const Icon(
                      Icons.local_police_outlined,
                      color: Colors.lightBlue,
                    ),
                    head: "組織・体制"),
    
                //本文
                buildText(
                  "当アプリは、内部規定の整備、従業員教育および適正な監査の実施等を通じて、本ポリシーの見直しを含めた社内体制の継続的強化・改善に努めます。",
                ),
                //見出し
                buildHead(
                    icon: const Icon(
                      Icons.local_police_outlined,
                      color: Colors.lightBlue,
                    ),
                    head: "方針の変更"),
                //本文
                buildText(
                  "本方針の内容は変更されることがあります。\n変更後の本方針については、当アプリが別途定める場合を除いて、当サイトに掲載した時から効力を生じるものとします。",
                ),
                const SizedBox(
                  height: 16,
                ),
                //制定日
                Text(
                  "制定日：2022年4月1日",
                  style: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //見出し
  Widget buildHead({required Icon icon, required String head}) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        children: [
          icon,
          Text(head,
              style: const TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 20,
                  color: Colors.white70)),
        ],
      ),
    );
  }

  //本文
  Widget buildText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(text, style: const TextStyle(color: Colors.white54)),
    );
  }
}