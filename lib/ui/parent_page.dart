import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tenor_kids/ui/register_page.dart';
import 'package:http/http.dart' as http;

class ParentPage extends StatefulWidget {
  const ParentPage({Key? key}) : super(key: key);

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
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
        child: Text('parent page'),
      ),
    );
  }
}
