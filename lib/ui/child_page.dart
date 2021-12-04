import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tenor_kids/ui/test/testA_page.dart';

class ChildPage extends StatefulWidget {
  const ChildPage({Key? key, required this.childName}) : super(key: key);

  final String childName;
  @override
  State<ChildPage> createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  Color colorText = const Color(0xff11265b);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFFf07735),
                    )),
                const SizedBox(width: 30),
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
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 110, right: 80),
            child: Text(
             'hi'.tr()+'${widget.childName}!',
              style: GoogleFonts.patuaOne(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF11265b),
                  fontSize: 80),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 110),
            child: Text('screening'.tr(),
                style: GoogleFonts.patuaOne(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF11265b),
                    fontSize: 35)),
          ),
          const SizedBox(height: 60),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 110),
              child: InkWell(
                onHover: (value) {
                  setState(() {
                    setState(() {
                      if(value) {
                        colorText = const Color(0xff7494e2);
                      } else {
                        colorText = const Color(0xFF11265b);
                      }
                    });
                  });
                },
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TestAPage())),
                child: Text('test_a_title'.tr(),
                    style: GoogleFonts.patuaOne(
                        color: colorText,
                        fontSize: 24,
                        decoration: TextDecoration.underline)),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
