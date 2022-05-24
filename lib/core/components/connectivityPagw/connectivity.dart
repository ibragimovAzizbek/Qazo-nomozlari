import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qazonomozlar/extensions/mq_extension.dart';

class ConnectivityPage extends StatelessWidget {
  const ConnectivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: context.h * 0.4,
              width: context.w * 0.8,
              child: Lottie.asset('assets/anim/connect.json'),
            ),
          ],
        ),
      ),
    );
  }
}
