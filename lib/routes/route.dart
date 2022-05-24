import 'package:flutter/material.dart';
import 'package:qazonomozlar/views/auth/views/sign_up_page.dart';
import 'package:qazonomozlar/views/home/view/home_page.dart';
import 'package:qazonomozlar/views/onBording/view/on_bording_page.dart';
import 'package:qazonomozlar/views/splash/splash_page.dart';
import 'package:qazonomozlar/views/splashLanguage/splash_language.dart';

class RouteController {
  static final RouteController _inheretence = RouteController._init();

  static RouteController get inherentce => _inheretence;

  RouteController._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashPage());

      case '/language':
        return MaterialPageRoute(builder: (context) => SplashLanguages());

      case '/onbording':
        return MaterialPageRoute(builder: (context) => OnBordingPage());

      case '/signUp':
        return MaterialPageRoute(builder: (context) => SignUp());


      case '/home':
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}
