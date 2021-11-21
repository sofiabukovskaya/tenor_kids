import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tenor_kids/ui/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final dataKeyAbout = GlobalKey();
    final dataKeyHome = GlobalKey();
    final dataKeyContactUs = GlobalKey();
    return Scaffold(
        backgroundColor: const Color(0xFFfffffe),
        appBar: PreferredSize(
            preferredSize: Size(screenSize.width, 1000),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 40, top: 40, right: 40, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Tenor Kids',
                      style: GoogleFonts.patuaOne(
                          color: const Color(0xFFf07735), fontSize: 40)),
                  SizedBox(width: screenSize.width / 2.6),
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
                  const SizedBox(
                      height: 20,
                      child: VerticalDivider(color: Color(0xFF11265b))),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () => Scrollable.ensureVisible(
                        dataKeyHome.currentContext!,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut),
                    child: Text('home'.tr(),
                        style: GoogleFonts.patuaOne(
                            color: const Color(0xFF11265b), fontSize: 20)),
                  ),
                  const SizedBox(width: 70),
                  InkWell(
                    onTap: () => Scrollable.ensureVisible(
                        dataKeyAbout.currentContext!,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut),
                    child: Text('about'.tr(),
                        style: GoogleFonts.patuaOne(
                            color: const Color(0xFF11265b), fontSize: 20)),
                  ),
                  const SizedBox(width: 70),
                  InkWell(
                    onTap: () => Scrollable.ensureVisible(
                        dataKeyContactUs.currentContext!,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut),
                    child: Text('contact_us'.tr(),
                        style: GoogleFonts.patuaOne(
                            color: const Color(0xFF11265b), fontSize: 20)),
                  ),
                  const SizedBox(width: 70),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    icon: const Icon(Icons.person),
                    color: const Color(0xFF11265b),
                  )
                ],
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                key: dataKeyHome,
                padding: const EdgeInsets.only(top: 30, left: 80, right: 80),
                child: Row(
                  children: [
                    SizedBox(height: screenSize.height / 1.5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('main_title'.tr(),
                            style: GoogleFonts.patuaOne(
                                color: const Color(0xFF11265b), fontSize: 90)),
                        const SizedBox(height: 20),
                        Text('main_subtitle'.tr(),
                            style: GoogleFonts.patuaOne(
                                color: const Color(0xFF11265b), fontSize: 20))
                      ],
                    ),
                    SizedBox(width: screenSize.width / 6),
                    SizedBox(
                        height: 600,
                        width: 600,
                        child: Image.asset('assets/images/tenorkid.png',
                            fit: BoxFit.fill))
                  ],
                ),
              ),
              SizedBox(height: screenSize.width / 6),
              Container(
                key: dataKeyAbout,
                width: screenSize.width,
                height: screenSize.height,
                color: const Color(0xFFfef6ef),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80, right: 80),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 600,
                            width: 600,
                            child: Image.asset('assets/images/family.png',
                                fit: BoxFit.fill)),
                        const SizedBox(width: 40),
                        Expanded(
                          child: Text("about_title".tr(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.patuaOne(
                                  color: const Color(0xFF11265b),
                                  fontSize: 20)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(key: dataKeyContactUs, height: screenSize.width / 7),
              SizedBox(
                width: screenSize.width,
                height: screenSize.height,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 400, right: 400),
                  child: Column(
                    children: [
                      Text('contact_us_title'.tr(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.patuaOne(
                              color: const Color(0xFF11265b), fontSize: 25)),
                      const SizedBox(height: 20),
                      TextFormField(
                        maxLines: 8,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xFF11265b).withOpacity(0.5),
                                width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          hintText: 'hint_text'.tr(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                                color:
                                    const Color(0xFF11265b).withOpacity(0.5)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
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
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                elevation: 0,
                                content: Text('thank_you_message'.tr(),
                                    style: GoogleFonts.patuaOne(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                                backgroundColor:
                                    const Color(0xFFf07735).withOpacity(0.4),
                              ));
                            },
                            child: Center(
                              child: Text('sent'.tr()),
                            )),
                      )
                    ],
                  ),
                )),
              ),
            ],
          ),
        ));
  }
}
