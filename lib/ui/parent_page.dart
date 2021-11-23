import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

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
              padding: const EdgeInsets.only(
                  left: 40, top: 40, right: 40, bottom: 10),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFf07735),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text('add_child'.tr()),
                      content: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'username'.tr(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('cancel'.tr(),
                                style: GoogleFonts.patuaOne(
                                    color: Colors.red.shade600, fontSize: 20))),
                        TextButton(
                            onPressed: () => {},
                            child: Text('add'.tr(),
                                style: GoogleFonts.patuaOne(
                                    color: const Color(0xFF11265b),
                                    fontSize: 20)))
                      ],
                    ));
          },
          child: const Icon(
            Icons.add,
            color: Color(0xFF11265b),
          ),
        ));
  }
}
