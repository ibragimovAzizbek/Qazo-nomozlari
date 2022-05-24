import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qazonomozlar/core/components/theme/theme_comp.dart';
import 'package:qazonomozlar/routes/route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await GetStorage.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('uz', 'UZ'),
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/lang', // <-- change the path of the translation files
      fallbackLocale: const Locale('uz', 'UZ'),
      saveLocale: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Qazo nomozlari',
      theme: lightMode,
      initialRoute: '/',
      onGenerateRoute: RouteController.inherentce.onGenerateRoute,
    );
  }
}
