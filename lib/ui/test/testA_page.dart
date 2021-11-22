// ignore_for_file: file_names

import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestAPage extends StatefulWidget {
  const TestAPage({Key? key}) : super(key: key);

  @override
  State<TestAPage> createState() => _TestAPageState();
}

class _TestAPageState extends State<TestAPage> {
  GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();
  FlipCardController flipCardController = FlipCardController();
  SwiperController swiperController = SwiperController();

  late List<Widget> cardsList;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    cardsList = [
      Center(
        child: FlipCard(
          key: cardKey1,
          controller: flipCardController,
          flipOnTouch: false,
          direction: FlipDirection.HORIZONTAL,
          front: Container(
            width: 500,
            height: 600,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Text('question1'.tr(),
                      style: GoogleFonts.patuaOne(
                          color: const Color(0xFF11265b), fontSize: 20)),
                  const SizedBox(height: 40),
                  Text('current_day'.tr(),
                      style: GoogleFonts.patuaOne(
                          color: const Color(0xFF11265b), fontSize: 16)),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xFF11265b).withOpacity(0.5),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: 'enter'.tr(),
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
                    height: 70,
                    width: 300,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: GoogleFonts.patuaOne(
                                color: Colors.white,
                                fontWeight: FontWeight.w100,
                                fontSize: 20),
                            primary: const Color(0xFFf07735),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () => cardKey1.currentState!.toggleCard(),
                        child: Center(
                          child: Text('sent_answer'.tr()),
                        )),
                  )
                ],
              ),
            ),
          ),
          back: Container(
            width: 500,
            height: 600,
            decoration: BoxDecoration(
                color: const Color(0xFFf07735).withOpacity(0.5),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Text('right_answer'.tr(),
                    style: GoogleFonts.patuaOne(
                        color: const Color(0xFF11265b), fontSize: 25)),
                const SizedBox(height: 50),
                Text(DateFormat('EEEE').format(DateTime.now()),
                    style: GoogleFonts.patuaOne(
                        color: const Color(0xFF11265b), fontSize: 17)),
                const SizedBox(height: 70),
                SizedBox(
                  height: 70,
                  width: 130,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: GoogleFonts.patuaOne(
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                              fontSize: 20),
                          primary: const Color(0xFFf07735),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        swiperController.move(1);
                        cardKey1.currentState!.widget.back;
                      },
                      child: Center(
                        child: Text('OK'.tr()),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
      Center(
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          flipOnTouch: false,
          front: Container(
            width: 500,
            height: 600,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: const Text('2'),
          ),
          back: Container(
            width: 500,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            height: 600,
          ),
        ),
      ),
      Center(
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          flipOnTouch: false,
          front: Container(
            width: 500,
            height: 600,
            child: const Text('3'),
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          back: Container(
            width: 500,
            height: 600,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
        ),
      ),
      Center(
        child: Container(
          width: 300,
          height: 400,
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: const Text('finish test'),
        ),
      )
    ];

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('test_a_title'.tr(),
                    style: GoogleFonts.patuaOne(
                        color: const Color(0xFF11265b), fontSize: 30)),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              height: 600,
              width: 600,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return cardsList[index];
                },
                controller: swiperController,
                itemCount: cardsList.length,
                pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        color: Color(0xFFf07735),
                        activeColor: Color(0xFF11265b))),
                control: SwiperControl(
                    color: const Color(0xFFf07735).withOpacity(0.4),
                    disableColor: const Color(0xFFf07735)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
