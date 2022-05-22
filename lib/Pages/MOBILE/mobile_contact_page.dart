import 'dart:convert';

import 'package:app_support_website/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sliding_sheet/sliding_sheet.dart';

class MobileContactPage extends StatefulWidget {
  const MobileContactPage({Key? key}) : super(key: key);

  @override
  State<MobileContactPage> createState() => _MobileContactPageState();
}

class _MobileContactPageState extends State<MobileContactPage> {
  late final nameCont = TextEditingController();
  late final emailCont = TextEditingController();
  final subjectCont = TextEditingController();
  final messageCont = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final namefocus = FocusNode();
  final agefocus = FocusNode();

  final String resetText = "";

  void resetContact() {
    nameCont.text = resetText;
    emailCont.text = resetText;
    subjectCont.text = resetText;
    messageCont.text = resetText;
  }

  void showSnackBar() {
    Get.snackbar('送信完了', '返信をお待ちください',
        snackPosition: SnackPosition.TOP,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeInOutBack,
        backgroundColor: Colors.white.withOpacity(0.6),
        animationDuration: const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: buildAppBar("お問い合わせ"),
            body: Form(
              key: _formKey,
              child: Stack(
                children: [
                  const Center(
                    child: SelectableText(
                      "mizuno.hikaru.01@gmail.com",
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ),
                  SlidingSheet(
                    elevation: 8,
                    cornerRadius: 16,
                    snapSpec: const SnapSpec(
                        initialSnap: 0.7, snappings: [0.3, 0.7, 0.9]),
                    builder: (context, state) {
                      return Container(
                        // height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                        ),
                        child: Column(
                          children: [
                            // Mail
                            buildTextField(
                                title: 'お名前',
                                controller: nameCont,
                                icon: const Icon(Icons.person),
                                hint: '山田太郎　または　会社名'),
                            emailTextField(
                                title: 'メールアドレス',
                                controller: emailCont,
                                icon: const Icon(Icons.mail),
                                hint: 'example@mail.com'),
                            buildTextField(
                                title: '件名',
                                controller: subjectCont,
                                icon: const Icon(Icons.subject),
                                hint: 'アプリ開発の依頼'),
                            contentTextField(
                                title: '内容',
                                controller: messageCont,
                                icon: const Icon(Icons.edit),
                                hint: ''),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        sendEmail(
                                            name: nameCont.text,
                                            email: emailCont.text,
                                            subject: subjectCont.text,
                                            message: messageCont.text);
                                      });
                                      showSnackBar();
                                      resetContact();
                                    }
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    height: 48,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        gradient: const LinearGradient(colors: [
                                          Colors.lightBlue,
                                          Colors.white70
                                        ]),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.blue.withOpacity(.6),
                                              spreadRadius: 1,
                                              blurRadius: 16,
                                              offset: const Offset(8, 8))
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "送信する",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      );
                    },
                    headerBuilder: (context, state) {
                      return Material(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Center(
                                child: Container(
                                  width: 60,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black38),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Future sendEmail(
      {required String name,
      required String email,
      required String subject,
      required String message}) async {
    const serviceId = 'service_1cwqwpt';
    const tempateId = 'template_1i08wn1';
    const userId = 'user_QJq7e6a5biy5mQMKpkqSs';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': tempateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'to_email': 'sabumonita@gmail.com',
            'user_subject': subject,
            'user_message': message
          }
        }));
    print(response.body);
  }

  Widget buildTextField(
          {required String title,
          required String hint,
          required Icon icon,
          required TextEditingController controller,
          int maxLines = 1}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: "必須   ", style: TextStyle(color: Colors.red)),
              TextSpan(
                  text: title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ])),
            const SizedBox(height: 10,),
            TextFormField(
              autofocus: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return '入力してください';
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: icon,
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey),
                errorStyle: const TextStyle(
                    color: Color.fromARGB(255, 250, 88, 76), fontSize: 13),
              ),
              controller: controller,
              enabled: true,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.name],
            ),
          ],
        ),
      );

  Widget emailTextField(
          {required String title,
          required String hint,
          required Icon icon,
          required TextEditingController controller,
          int maxLines = 1}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: "必須   ", style: TextStyle(color: Colors.red)),
              TextSpan(
                  text: title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ])),
             const SizedBox(height: 10,),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.mail),
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                hintText: 'example@mail.com',
                hintStyle: const TextStyle(color: Colors.grey),
                errorStyle: const TextStyle(
                    color: Color.fromARGB(255, 250, 88, 76), fontSize: 13),
              ),
              validator: (value) {
                const pattern =
                    r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                final regExp = RegExp(pattern);

                if (value!.isEmpty) {
                  return '入力してください';
                } else if (!regExp.hasMatch(value)) {
                  return '無効なメールアドレスです';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.email],
            )
          ],
        ),
      );

  Widget contentTextField(
          {required String title,
          required String hint,
          required Icon icon,
          required TextEditingController controller,
          int maxLines = 5}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: "必須   ", style: TextStyle(color: Colors.red)),
              TextSpan(
                  text: title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ])),
             const SizedBox(height: 10,),
            TextFormField(
                controller: controller,
                maxLines: maxLines,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '入力してください';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: icon,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  errorStyle: const TextStyle(
                      color: Color.fromARGB(255, 250, 88, 76), fontSize: 13),
                ),
                textInputAction: TextInputAction.done)
          ],
        ),
      );
}
