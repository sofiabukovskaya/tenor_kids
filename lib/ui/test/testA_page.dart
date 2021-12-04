// ignore_for_file: file_names

import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tenor_kids/ui/test_result_page.dart';

class TestAPage extends StatefulWidget {
  const TestAPage({Key? key}) : super(key: key);

  @override
  State<TestAPage> createState() => _TestAPageState();
}

class _TestAPageState extends State<TestAPage> {
  GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey3 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey4 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey5 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey6 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey7 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey8 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey9 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey10 = GlobalKey<FlipCardState>();

  SwiperController swiperController = SwiperController();

  late List<Widget> cardsList;

  bool isAnsweredFirst = false;
  bool isAnsweredSecond = false;
  bool isAnsweredThird = false;
  bool isAnsweredFourth = false;
  bool isAnsweredFifth = false;
  bool isAnsweredSix = false;
  bool isAnsweredSeven = false;
  bool isAnsweredEight = false;
  bool isAnsweredNine = false;
  bool isAnsweredTen = false;

  late Timer _timer;
  int seconds = 0;
  int minutes = 0;
  int hours = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds < 0) {
          timer.cancel();
        } else {
          seconds = seconds + 1;
          if (seconds > 59) {
            minutes += 1;
            seconds = 0;
            if (minutes > 59) {
              hours += 1;
              minutes = 0;
            }
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    cardsList = [
      Center(
        child: FlipCard(
          key: cardKey1,
          flipOnTouch: false,
          direction: FlipDirection.HORIZONTAL,
          front: isAnsweredFirst
              ? Container(
                  width: 500,
                  height: 600,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text('answered_title'.tr(),
                        style: GoogleFonts.patuaOne(
                            color: const Color(0xFF11265b), fontSize: 20)),
                  ),
                )
              : Container(
                  width: 500,
                  height: 600,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
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
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'enter'.tr(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5)),
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
                              onPressed: () =>
                                  cardKey1.currentState!.toggleCard(),
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
                        setState(() {
                          isAnsweredFirst = true;
                        });
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
          key: cardKey2,
          direction: FlipDirection.HORIZONTAL,
          flipOnTouch: false,
          front: isAnsweredSecond
              ? Container(
                  width: 500,
                  height: 600,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text('answered_title'.tr(),
                        style: GoogleFonts.patuaOne(
                            color: const Color(0xFF11265b), fontSize: 20)),
                  ),
                )
              : Container(
                  width: 500,
                  height: 600,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        Text('question2'.tr(),
                            style: GoogleFonts.patuaOne(
                                color: const Color(0xFF11265b), fontSize: 20)),
                        const SizedBox(height: 20),
                        Text('guess'.tr(),
                            style: GoogleFonts.patuaOne(
                                color: const Color(0xFF11265b), fontSize: 16)),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 250,
                          width: 250,
                          child: Image.asset('assets/images/abc.jpg',
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'enter'.tr(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5)),
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
                              onPressed: () =>
                                  cardKey2.currentState!.toggleCard(),
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
                Text('ABC',
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
                        swiperController.move(2);
                        setState(() {
                          isAnsweredSecond = true;
                        });
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
          key: cardKey3,
          direction: FlipDirection.HORIZONTAL,
          flipOnTouch: false,
          front: Container(
            width: 500,
            height: 600,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: isAnsweredThird
                ? Container(
                    width: 500,
                    height: 600,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text('answered_title'.tr(),
                          style: GoogleFonts.patuaOne(
                              color: const Color(0xFF11265b), fontSize: 20)),
                    ),
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 100),
                        Text('question3'.tr(),
                            style: GoogleFonts.patuaOne(
                                color: const Color(0xFF11265b), fontSize: 20)),
                        const SizedBox(height: 40),
                        Text('question3_text'.tr(),
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
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'enter'.tr(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5)),
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
                              onPressed: () =>
                                  cardKey3.currentState!.toggleCard(),
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
                Text('sweet'.tr(),
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
                        swiperController.move(3);
                        setState(() {
                          isAnsweredThird = true;
                        });
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
          key: cardKey4,
          direction: FlipDirection.HORIZONTAL,
          flipOnTouch: false,
          front: Container(
            width: 500,
            height: 600,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: isAnsweredFourth
                ? Container(
                    width: 500,
                    height: 600,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text('answered_title'.tr(),
                          style: GoogleFonts.patuaOne(
                              color: const Color(0xFF11265b), fontSize: 20)),
                    ),
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 100),
                        Text('question4'.tr(),
                            style: GoogleFonts.patuaOne(
                                color: const Color(0xFF11265b), fontSize: 20)),
                        const SizedBox(height: 40),
                        Text('question4_text'.tr(),
                            textAlign: TextAlign.center,
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
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'enter'.tr(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5)),
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
                              onPressed: () =>
                                  cardKey4.currentState!.toggleCard(),
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
                Text('rabbit'.tr(),
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
                        swiperController.move(4);
                        setState(() {
                          isAnsweredFourth = true;
                        });
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
          key: cardKey5,
          direction: FlipDirection.HORIZONTAL,
          flipOnTouch: false,
          front: isAnsweredFifth
              ? Container(
                  width: 500,
                  height: 600,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text('answered_title'.tr(),
                        style: GoogleFonts.patuaOne(
                            color: const Color(0xFF11265b), fontSize: 20)),
                  ),
                )
              : Container(
                  width: 500,
                  height: 600,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        Text('question5'.tr(),
                            style: GoogleFonts.patuaOne(
                                color: const Color(0xFF11265b), fontSize: 20)),
                        const SizedBox(height: 20),
                        Text('question5_text'.tr(),
                            style: GoogleFonts.patuaOne(
                                color: const Color(0xFF11265b), fontSize: 16)),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.asset('assets/images/red_circle.jpg',
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'enter'.tr(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5)),
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
                              onPressed: () =>
                                  cardKey5.currentState!.toggleCard(),
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
                Text('red'.tr(),
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
                        swiperController.move(5);
                        setState(() {
                          isAnsweredFifth = true;
                        });
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
          key: cardKey6,
          direction: FlipDirection.HORIZONTAL,
          flipOnTouch: false,
          front: Container(
            width: 500,
            height: 600,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: isAnsweredSix
                ? Container(
                    width: 500,
                    height: 600,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text('answered_title'.tr(),
                          style: GoogleFonts.patuaOne(
                              color: const Color(0xFF11265b), fontSize: 20)),
                    ),
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 100),
                        Text('question6'.tr(),
                            style: GoogleFonts.patuaOne(
                                color: const Color(0xFF11265b), fontSize: 20)),
                        const SizedBox(height: 40),
                        Text('question6_text'.tr(),
                            textAlign: TextAlign.center,
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
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'enter'.tr(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5)),
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
                              onPressed: () =>
                                  cardKey6.currentState!.toggleCard(),
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
                Text('6',
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
                        swiperController.move(6);
                        setState(() {
                          isAnsweredSix = true;
                        });
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
          key: cardKey7,
          direction: FlipDirection.HORIZONTAL,
          flipOnTouch: false,
          front: Container(
            width: 500,
            height: 600,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: isAnsweredSeven
                ? Container(
                    width: 500,
                    height: 600,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text('answered_title'.tr(),
                          style: GoogleFonts.patuaOne(
                              color: const Color(0xFF11265b), fontSize: 20)),
                    ),
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 100),
                        Text('question7'.tr(),
                            style: GoogleFonts.patuaOne(
                                color: const Color(0xFF11265b), fontSize: 20)),
                        const SizedBox(height: 40),
                        Text('question7_text'.tr(),
                            textAlign: TextAlign.center,
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
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'enter'.tr(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5)),
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
                              onPressed: () =>
                                  cardKey7.currentState!.toggleCard(),
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
                Text('sets'.tr(),
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
                        swiperController.move(7);
                        setState(() {
                          isAnsweredSeven = true;
                        });
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
          key: cardKey8,
          direction: FlipDirection.HORIZONTAL,
          flipOnTouch: false,
          front: Container(
            width: 500,
            height: 600,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: isAnsweredEight
                ? Container(
                    width: 500,
                    height: 600,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text('answered_title'.tr(),
                          style: GoogleFonts.patuaOne(
                              color: const Color(0xFF11265b), fontSize: 20)),
                    ),
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 100),
                        Text('question8'.tr(),
                            style: GoogleFonts.patuaOne(
                                color: const Color(0xFF11265b), fontSize: 20)),
                        const SizedBox(height: 40),
                        Text('question8_text'.tr(),
                            textAlign: TextAlign.center,
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
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'enter'.tr(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5)),
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
                              onPressed: () =>
                                  cardKey8.currentState!.toggleCard(),
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
                Text('puddles'.tr(),
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
                        swiperController.move(8);
                        setState(() {
                          isAnsweredEight = true;
                        });
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
          key: cardKey9,
          direction: FlipDirection.HORIZONTAL,
          flipOnTouch: false,
          front: Container(
            width: 500,
            height: 600,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: isAnsweredNine
                ? Container(
                    width: 500,
                    height: 600,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text('answered_title'.tr(),
                          style: GoogleFonts.patuaOne(
                              color: const Color(0xFF11265b), fontSize: 20)),
                    ),
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 100),
                        Text('question9'.tr(),
                            style: GoogleFonts.patuaOne(
                                color: const Color(0xFF11265b), fontSize: 20)),
                        const SizedBox(height: 40),
                        Text('question9_text'.tr(),
                            textAlign: TextAlign.center,
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
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'enter'.tr(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5)),
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
                              onPressed: () =>
                                  cardKey9.currentState!.toggleCard(),
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
                Text('snow'.tr(),
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
                        swiperController.move(9);
                        setState(() {
                          isAnsweredNine = true;
                        });
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
          key: cardKey10,
          direction: FlipDirection.HORIZONTAL,
          flipOnTouch: false,
          front: Container(
            width: 500,
            height: 600,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: isAnsweredTen
                ? Container(
                    width: 500,
                    height: 600,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text('answered_title'.tr(),
                          style: GoogleFonts.patuaOne(
                              color: const Color(0xFF11265b), fontSize: 20)),
                    ),
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 100),
                        Text('question10'.tr(),
                            style: GoogleFonts.patuaOne(
                                color: const Color(0xFF11265b), fontSize: 20)),
                        const SizedBox(height: 40),
                        Text('question10_text'.tr(),
                            textAlign: TextAlign.center,
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
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'enter'.tr(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: const Color(0xFF11265b)
                                        .withOpacity(0.5)),
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
                              onPressed: () =>
                                  cardKey10.currentState!.toggleCard(),
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
                Text('needles'.tr(),
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
                        swiperController.move(10);
                        setState(() {
                          isAnsweredTen = true;
                        });
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
        child: Container(
          width: 500,
          height: 600,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              const SizedBox(height: 200),
              Text('finish'.tr(),
                  style: GoogleFonts.patuaOne(
                      color: const Color(0xFF11265b), fontSize: 25)),
              const SizedBox(height: 100),
              SizedBox(
                height: 70,
                width: 250,
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
                      setState(() {
                        _timer.cancel();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>  TestResultPage(seconds: seconds)));
                      });
                    },
                    child: Center(
                      child: Text('sent_result'.tr()),
                    )),
              )
            ],
          ),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('test_a_title'.tr(),
                      style: GoogleFonts.patuaOne(
                          color: const Color(0xFF11265b), fontSize: 30)),
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: Text(
                      "0$hours:0$minutes:$seconds",
                      style: GoogleFonts.patuaOne(
                          color: const Color(0xFF11265b), fontSize: 30),
                    ),
                  )
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
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
