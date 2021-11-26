import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tenor_kids/ui/child_page.dart';
import 'package:tenor_kids/ui/user.dart';

class ParentPage extends StatefulWidget {
  const ParentPage({Key? key}) : super(key: key);

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  DateTime selectedDate = DateTime.now();
  FocusNode focusNode = FocusNode();
  int count = 1;
  List<User> listUsers = [
    User(name: 'Sonya', lastName: 'Sonshik', birthday: DateTime(2015, 8, 5, 6)),
    User(name: 'Lol', lastName: 'lastName', birthday: DateTime(2015, 8, 5, 6)),
    User(name: 'Denis', lastName: 'Love', birthday: DateTime(2015, 8, 5, 6)),
    User(
        name: 'Petya', lastName: 'lastName', birthday: DateTime(2015, 8, 5, 6)),
    User(name: 'Oleg', lastName: 'lastName', birthday: DateTime(2015, 8, 5, 6)),
    User(name: 'Kek', lastName: 'lastName', birthday: DateTime(2015, 8, 5, 6))
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
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
        body: Center(
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text(
                        '#',
                        style: GoogleFonts.patuaOne(
                            color: const Color(0xFF11265b), fontSize: 20),
                      ),
                    ),
                    DataColumn(
                        label: Text(
                          'first_name'.tr(),
                          style: GoogleFonts.patuaOne(
                              color: const Color(0xFF11265b), fontSize: 20),
                        ),
                        numeric: true),
                    DataColumn(
                      label: Text(
                        'last_name'.tr(),
                        style: GoogleFonts.patuaOne(
                            color: const Color(0xFF11265b), fontSize: 20),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'birthday_title'.tr(),
                        style: GoogleFonts.patuaOne(
                            color: const Color(0xFF11265b), fontSize: 20),
                      ),
                    ),
                  ],
                  rows: listUsers
                      .map(
                        (user) => DataRow(cells: [
                          DataCell(
                            Text(count.toString()),
                          ),
                          DataCell(
                            Text(user.name),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChildPage(childName: user.name)),
                              );
                            },
                          ),
                          DataCell(
                            Text(user.lastName),
                          ),
                          DataCell(
                            Text(
                                DateFormat('yyyy-MM-dd').format(user.birthday)),
                          ),
                        ]),
                      )
                      .toList())),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFf07735),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text('add_child'.tr()),
                      content: SizedBox(
                        height: 350,
                        width: 500,
                        child: Column(
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
                                hintText: 'name'.tr(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color: const Color(0xFF11265b)
                                          .withOpacity(0.5)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
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
                                hintText: 'surname'.tr(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color: const Color(0xFF11265b)
                                          .withOpacity(0.5)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              focusNode: focusNode,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color(0xFF11265b)
                                            .withOpacity(0.5),
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  hintText: selectedDate == DateTime.now()
                                      ? DateFormat('yyyy-MM-dd')
                                          .format(selectedDate)
                                      : 'birthday_kid'.tr(),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                        color: const Color(0xFF11265b)
                                            .withOpacity(0.5)),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () => _selectDate(context),
                                    icon: Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey.shade900,
                                    ),
                                  )),
                            ),
                            const SizedBox(height: 20),
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
