import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tenor_kids/ui/parent_page.dart';
import 'package:tenor_kids/ui/register_page.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    TextEditingController userText = TextEditingController();
    TextEditingController passwordText = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFfffffe),
      appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 1000),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 40, top: 40, right: 40, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Tenor Kids',
                    style: GoogleFonts.patuaOne(
                        color: const Color(0xFFf07735), fontSize: 40)),
                SizedBox(width: screenSize.width / 1.4),
                InkWell(
                  onTap: () {
                    setState(() {
                      EasyLocalization.of(context)!
                          .setLocale(const Locale('en', 'US'));
                    });
                  },
                  child: Text('EN',
                      style: GoogleFonts.patuaOne(
                          color: const Color(0xFF11265b), fontSize: 20)),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    setState(() {
                      EasyLocalization.of(context)!
                          .setLocale(const Locale('uk', 'UA'));
                    });
                  },
                  child: Text('UK',
                      style: GoogleFonts.patuaOne(
                          color: const Color(0xFF11265b), fontSize: 20)),
                ),
                const SizedBox(width: 20),
              ],
            ),
          )),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 200),
            Text('login_title'.tr(),
                textAlign: TextAlign.center,
                style: GoogleFonts.patuaOne(
                    color: const Color(0xFF11265b), fontSize: 25)),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 500, right: 500),
              child: TextFormField(
                controller: userText,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color(0xFF11265b).withOpacity(0.5),
                        width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'username'.tr(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                        color: const Color(0xFF11265b).withOpacity(0.5)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 500, right: 500),
              child: TextFormField(
                controller: passwordText,
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color(0xFF11265b).withOpacity(0.5),
                        width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'password'.tr(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                        color: const Color(0xFF11265b).withOpacity(0.5)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              width: 250,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: GoogleFonts.patuaOne(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 30),
                      primary: const Color(0xFFf07735),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () async {
                    final accessToken =
                        await loginFunction(userText.text, passwordText.text);
                    if (accessToken != 'error') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ParentPage()));
                    } else {
                      showDialog(context: context, builder: (context) => AlertDialog(
                        title: const Text('Sorry, something gone wrong, try again'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('Ok',
                                  style: GoogleFonts.patuaOne(fontSize: 20)))
                        ],
                      ));
                    }
                  },
                  child: Center(
                    child: Text('login_title'.tr()),
                  )),
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
              },
              child: Text('donthave_account'.tr(),
                  style: GoogleFonts.patuaOne(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  )),
            )
          ],
        ),
      ),
    );
  }

  loginFunction(String username, String password) async {
    var client = http.Client();

    final Map<String, dynamic> data = {
      'username': username,
      'password': password,
    };
    try {
      final http.Response response = await client.post(
          Uri.parse('https://localhost:44307/api/UserAuth/login'),
          body: data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        final json = jsonDecode(response.body);
        final result = json['accessToken'];
        print(result.toString());
        return Future.value(result.toString());
      }
      return Future.value('error');
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return Future.value('error');
  }
}
