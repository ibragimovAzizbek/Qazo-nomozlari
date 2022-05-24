import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qazonomozlar/extensions/mq_extension.dart';

class SplashLanguages extends StatelessWidget {
  SplashLanguages({Key? key}) : super(key: key);

  List<String> path = [
    'assets/images/uzb.png',
    'assets/images/us.png',
    'assets/images/rus.png',
  ];

  List<String> languages = [
    'O\'zbek tili',
    'English language',
    'Русский язык',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: context.h * 0.13,
              width: context.w,
              child: Image.asset("assets/images/VectorGreen.png"),
            ),
            SizedBox(height: context.h * 0.1),
            const Text(
              "Tilni tanlang / Выберите язык",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: context.h * 0.1),
            SizedBox(
              height: context.h * 0.3,
              child: ListView.builder(
                itemBuilder: (context, index) => languageType(
                  context,
                  path: path[index],
                  title: languages[index],
                  index: index,
                ),
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column languageType(context,
      {required String path, required String title, required int index}) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(path),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          onTap: () {
            if (index == 0) {
              EasyLocalization.of(context)!.setLocale(const Locale('uz', 'UZ'));
            } else if (index == 1) {
              // context.locale = const Locale('en', 'US');
              EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
            } else if (index == 2) {
              // context.locale = const Locale('ru', 'RU');
              EasyLocalization.of(context)!.setLocale(const Locale('ru', 'RU'));
            }
            // Navigator.pushNamedAndRemoveUntil(
            //     context, '/onbording', (route) => false);

            Navigator.pushNamedAndRemoveUntil(
                context, '/signUp', (route) => false);
          },
        ),
        const Divider(indent: 15, endIndent: 15),
        const SizedBox(height: 10)
      ],
    );
  }
}
