import 'package:flutter/material.dart';
import 'package:tenor_kids/app.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    path: 'assets/translations',
    supportedLocales: const [Locale('en', 'US'), Locale('uk', 'UA')],
    fallbackLocale: const Locale('en', 'US'),
    saveLocale: true,
    child: const App(),
  ));
}
