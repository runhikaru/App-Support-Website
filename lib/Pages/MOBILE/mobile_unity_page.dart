import 'package:app_support_website/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MobileUnityPage extends StatefulWidget {
  const MobileUnityPage({Key? key}) : super(key: key);

  @override
  _MobileUnityPageState createState() => _MobileUnityPageState();
}

class _MobileUnityPageState extends State<MobileUnityPage> {
  final ScrollController scrollController = ScrollController();

  final controller = CarouselController();
  int activeIndex = 0;
  final img_apek = [
    'assets/app/apek_app/apek.png',
    'assets/app/apek_app/apek1.png',
    'assets/app/apek_app/apek2.png',
    'assets/app/apek_app/apek3.png',
  ];

  final controller2 = CarouselController();
  int activeIndex2 = 0;
  final img_kouya = [
    'assets/app/kouya_app/kouya1.png',
    'assets/app/kouya_app/kouya2.png',
    'assets/app/kouya_app/kouya3.png',
  ];

 
  @override
  Widget build(BuildContext context) {
    const appStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.red,
      fontFamily: 'sawarabi',
    );

    const descriptionStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.red,
      fontFamily: 'sawarabi',
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: buildAppBar("開発言語-Unity-"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(
                  height: 40,
                ),

                //画�?
                Stack(
                  children: [
                    CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: img_apek.length,
                      options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2,
                          autoPlayCurve: Curves.easeInExpo,
                          autoPlayAnimationDuration: const Duration(seconds: 3),
                          height: 270,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          reverse: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex = index;
                            });
                          }),
                      itemBuilder: (ctx, index, realIndex) {
                        final apekImg = img_apek[index];
                        return buildImage(apekImg);
                      },
                    ),
                  ],
                ),

                Text("Apek Legends Mobile", style: appStyle),

                const SizedBox(
                  height: 40,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Text(
                      "渾身の技術を詰め込んだFPSゲーム！\n舞台は、中世ヨーロッパの城。\nロシアとベルギーのユーザーによくダウンロードされています。",
                      style: descriptionStyle),
                ),

                const SizedBox(
                  height: 40,
                ),

                buildAppleStoreButton(onClick: apekIOSURL),

                const SizedBox(
                  height: 40,
                ),

                buildGooglePlayButton(onClick: apekAndroidURL),

                const SizedBox(
                  height: 100,
                ),

                Divider(
                  thickness: 3,
                  color: Colors.red,
                ),

                const SizedBox(
                  height: 100,
                ),

                //画�?
                Stack(
                  children: [
                    CarouselSlider.builder(
                      carouselController: controller2,
                      itemCount: img_kouya.length,
                      options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2,
                          autoPlayCurve: Curves.easeInExpo,
                          autoPlayAnimationDuration: const Duration(seconds: 3),
                          height: 270,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          reverse: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex2 = index;
                            });
                          }),
                      itemBuilder: (ctx, index, realIndex) {
                        final fpsImg = img_kouya[index];
                        return buildImage(fpsImg);
                      },
                    ),
                  ],
                ),

                Text("荒野運動", style: appStyle),

                const SizedBox(
                  height: 40,
                ),

                Text("空中移動も自由自在！\nロボットの操縦や個性的な武器の数々！\n廃城で敵を殲滅せよ",
                    style: descriptionStyle),

                const SizedBox(
                  height: 40,
                ),

                buildGooglePlayButton(onClick: fpsAndroidURL),

                const SizedBox(
                  height: 40,
                ),

                // buildGooglePlayButton(onClick: ),

                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
