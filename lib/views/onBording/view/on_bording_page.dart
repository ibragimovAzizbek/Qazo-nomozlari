import 'package:flutter/material.dart';

class OnBordingPage extends StatelessWidget {
  const OnBordingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: [],
        ),
      ),
    );
  }
}
