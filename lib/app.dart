import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tenor_kids/ui/parent_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const ParentPage(),
    );
  }
}
