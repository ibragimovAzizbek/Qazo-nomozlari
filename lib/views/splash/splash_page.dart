import 'package:flutter/material.dart';
import 'package:qazonomozlar/core/constants/colors/color_const.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacementNamed(context, '/language');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.green100,
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Image.asset('assets/images/Vector.png'),
        ),
      ),
    );
  }
}
