import 'dart:convert';

import 'package:app_support_website/Widget/on_hover_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DesktopContactBody extends StatefulWidget {
  final GlobalKey contactKey;

  const DesktopContactBody({Key? key, required this.contactKey})
      : super(key: key);

  @override
  State<DesktopContactBody> createState() => _DesktopContactBodyState();
}

class _DesktopContactBodyState extends State<DesktopContactBody> {
  final _formKey = GlobalKey<FormState>();

  //Contact
  late final nameCont = TextEditingController();
  late final emailCont = TextEditingController();
  final subjectCont = TextEditingController();
  final messageCont = TextEditingController();

  final String resetText = "";
  void resetContact() {
    nameCont.text = resetText;
    emailCont.text = resetText;
    subjectCont.text = resetText;
    messageCont.text = resetText;
  }

  _showSnackBar() {
    const snackBar = SnackBar(
      elevation: 25,
      duration: Duration(seconds: 9),
      backgroundColor: Colors.lightGreenAccent,
      content: Text(
        "送信完了\n返信をお待ちくださいませ。",
        style: TextStyle(fontSize: 60, color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool bikSize = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //contact
          Container(
            key: widget.contactKey,
            width: double.infinity,
            height: 100,
            color: Colors.white,
            child: const Text(
              'CONTACT',
              style: TextStyle(
                fontFamily: 'VujahdayScript',
                fontSize: 80,
              ),
            ),
          ),

          const SizedBox(
            height: 60,
          ),
          buildTextField(
              title: 'お名前',
              controller: nameCont,
              icon: const Icon(Icons.person),
              hint: '山田太郎 または 会社名'),
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

          const SizedBox(
            height: 60,
          ),

          // Send Button
          OnHoverWidget(
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
                  _showSnackBar();
                  resetContact();
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 48,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: const LinearGradient(
                        colors: [Colors.lightBlue, Colors.white70]),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withOpacity(.6),
                          spreadRadius: 1,
                          blurRadius: 16,
                          offset: const Offset(8, 8))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("送信する",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 250,)
        ],
      ),
    );
  }

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
  }

  Widget buildTextField(
          {required String title,
          required String hint,
          required Icon icon,
          required TextEditingController controller,
          int maxLines = 1}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: "必須   ",
                  style: TextStyle(color: Colors.red, fontFamily: "sawarabi")),
              TextSpan(
                  text: title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28)),
            ])),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 500,
              child: TextFormField(
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
                      borderRadius: BorderRadius.circular(40)),
                  hintText: hint,
                  hintStyle: const TextStyle(color: Colors.grey),
                  errorStyle: const TextStyle(
                      color: Color.fromARGB(255, 250, 88, 76), fontSize: 13),
                ),
                textInputAction: TextInputAction.done,
                controller: controller,
                enabled: true,
                style: const TextStyle(
                    fontFamily: "sawarabi",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
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
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: "必須   ",
                  style: TextStyle(color: Colors.red, fontFamily: "sawarabi")),
              TextSpan(
                  text: title,
                  style: const TextStyle(
                      fontFamily: "sawarabi",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28)),
            ])),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 500,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.mail),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
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
                    return 'このメールアドレスは有効ではありません';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
              ),
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
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: "必須   ",
                  style: TextStyle(color: Colors.red, fontFamily: "sawarabi")),
              TextSpan(
                  text: title,
                  style: const TextStyle(
                      fontFamily: "sawarabi",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28)),
            ])),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 500,
              child: TextFormField(
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
                  errorStyle: const TextStyle(
                      color: Color.fromARGB(255, 250, 88, 76), fontSize: 13),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      );
}
