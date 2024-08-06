
import 'package:flutter/material.dart';
import 'package:flutter_workshop_1/src/pages/home/home_page.dart';
import 'package:flutter_workshop_1/src/pages/login/login_page.dart';
import 'package:flutter_workshop_1/src/pages/register/register_page.dart';

class AppRoute {
  static const login = 'login';
  static const home = 'home';
  static const register = 'register';

  static get all => <String, WidgetBuilder>{
        login: (BuildContext con) => const LoginPage(),
        home: (BuildContext con) => const HomePage(),
    register: (BuildContext con) => const RegisterPage(),
      };
}
