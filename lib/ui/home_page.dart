import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFfffffe),
        appBar: PreferredSize(
            preferredSize: Size(screenSize.width, 1000),
            child: Padding(
              padding: const EdgeInsets.only(left: 80, top: 70, right: 80),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Tenor Kids',
                      style: GoogleFonts.patuaOne(
                          color: const Color(0xFFf07735), fontSize: 40)),
                   SizedBox(width: screenSize.width / 2.3),
                  Text('Home',
                      style:
                          GoogleFonts.patuaOne(color: const Color(0xFF11265b), fontSize: 20)),
                  const SizedBox(width: 70),
                  Text('About',
                      style:
                          GoogleFonts.patuaOne(color: const Color(0xFF11265b), fontSize: 20)),
                  const SizedBox(width: 70),
                  Text('Contact',
                      style:
                          GoogleFonts.patuaOne(color: const Color(0xFF11265b), fontSize: 20)),
                  const SizedBox(width: 90),
                  IconButton(
                    onPressed: () => {},
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
                padding: const EdgeInsets.only(top: 30, left: 80, right: 80),
                child: Row(
                  children: [
                     SizedBox(height: screenSize.height / 1.5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Better kids,\nBetter World',
                            style: GoogleFonts.patuaOne(
                                color: const Color(0xFF11265b), fontSize: 90)),
                        const SizedBox(height: 20),
                        Text('Educational system for children',
                            style:
                            GoogleFonts.patuaOne(color: const Color(0xFF11265b), fontSize: 20))
                      ],
                    ),
                    SizedBox(width: screenSize.width / 5),
                    SizedBox(height: 600, width: 600, child: Image.asset('assets/images/tenorkid.png', fit: BoxFit.fill,))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
