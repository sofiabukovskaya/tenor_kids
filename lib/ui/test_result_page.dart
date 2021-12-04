import 'dart:convert';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:tenor_kids/ui/parent_page.dart';
import 'package:universal_html/html.dart';

class TestResultPage extends StatefulWidget {
  const TestResultPage({Key? key, required this.seconds}) : super(key: key);

  final int seconds;
  @override
  State<TestResultPage> createState() => _TestResultPageState();
}

class _TestResultPageState extends State<TestResultPage> {
  Map<String, double> dataMap = {
    "Count answers": 10,
    "Right answers": 3,
  };
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
                SizedBox(width: screenSize.width / 1.5),
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
                IconButton(onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ParentPage())), icon: const Icon(Icons.home, color: Color(0xFFf07735)))
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Text('result_title'.tr(),
                  style: GoogleFonts.patuaOne(
                      color: const Color(0xFF11265b), fontSize: 20)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 110),
              child: Text(
                  'time_passed'.tr() + ' - ${formatedTime(widget.seconds)}',
                  style: GoogleFonts.patuaOne(
                      color: const Color(0xFF11265b), fontSize: 20)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 110),
              child: Text('Тут будет результат и описание',
                  style: GoogleFonts.patuaOne(
                      color: const Color(0xFF11265b), fontSize: 20)),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 110),
              child: Center(
                child: SizedBox(
                  height: 350,
                  width: 350,
                  child: PieChart(
                      dataMap: dataMap,
                      animationDuration: const Duration(milliseconds: 900),
                      chartLegendSpacing: 32,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      colorList: const [Colors.redAccent, Colors.yellow],
                      initialAngleInDegree: 0,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 32,
                      centerText: 'testA_result'.tr(),
                      legendOptions: const LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.right,
                        showLegends: true,
                        legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        showChartValuesInPercentage: true,
                        showChartValuesOutside: false,
                        decimalPlaces: 1,
                      )),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: InkWell(
                onHover: (value) {
                  setState(() {
                    setState(() {
                      if (value) {
                        colorText = const Color(0xff7494e2);
                      } else {
                        colorText = const Color(0xFF11265b);
                      }
                    });
                  });
                },
                onTap: ()=> _createPDF(formatedTime(widget.seconds)),
                child: Text('pdf_title'.tr(),
                    style: GoogleFonts.patuaOne(
                        color: colorText,
                        fontSize: 24,
                        decoration: TextDecoration.underline)),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  String formatedTime(int secTime) {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int min = secTime ~/ 60;
    int sec = secTime % 60;

    String parsedTime =
        getParsedTime(min.toString()) + " : " + getParsedTime(sec.toString());

    return parsedTime;
  }

  Future<void> _createPDF(String time) async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    final PdfPageTemplateElement headerTemplate =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));

    headerTemplate.graphics.drawString('Tenor Kids                                             Test Result',
        PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: const Rect.fromLTWH(0, 15, 500, 20));
    document.template.top = headerTemplate;

    final PdfPageTemplateElement footerTemplate =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
    footerTemplate.graphics.drawString(
        'The report was generated  -  ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())}',
        PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: const Rect.fromLTWH(0, 15, 400, 20));
    document.template.bottom = footerTemplate;

    page.graphics.drawImage(PdfBitmap(await _readImageData('family.png')),
        Rect.fromLTWH(0, 20, 200, 200));

    page.graphics.drawString(
        'Test result is: ', PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: Rect.fromLTWH(0, 250, 0, 0));

    page.graphics.drawString(
        'Test result is: ', PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: Rect.fromLTWH(0, 300, 0, 0));

    page.graphics.drawString(
        'The test was written in  $time ', PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: Rect.fromLTWH(0, 350, 0, 0));

    List<int> bytes = document.save();
    document.dispose();

   await saveAndLaunchFile(bytes, 'test_result.pdf');
  }

  Future<Uint8List> _readImageData(String name) async {
    final data = await rootBundle.load('assets/images/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", fileName)
      ..click();
  }
}
