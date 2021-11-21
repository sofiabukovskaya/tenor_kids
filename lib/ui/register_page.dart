import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tenor_kids/ui/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
        child: Column(
          children: [
            const SizedBox(height: 70),
            Text('sign_up'.tr(),
                textAlign: TextAlign.center,
                style: GoogleFonts.patuaOne(
                    color: const Color(0xFF11265b), fontSize: 25)),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 500, right: 500),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color(0xFF11265b).withOpacity(0.5),
                        width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'name'.tr(),
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
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color(0xFF11265b).withOpacity(0.5),
                        width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'surname'.tr(),
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
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xFF11265b).withOpacity(0.5),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: selectedDate == DateTime.now()
                        ? DateFormat('yyyy-MM-dd').format(selectedDate)
                        : 'birthday'.tr(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                          color: const Color(0xFF11265b).withOpacity(0.5)),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => _selectDate(context),
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.grey.shade900,
                      ),
                    )),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 500, right: 500),
              child: TextFormField(
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
                  onPressed: () {},
                  child: Center(
                    child: Text('sign_up'.tr()),
                  )),
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: Text('have_account'.tr(),
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
}
