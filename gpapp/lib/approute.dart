import 'package:flutter/material.dart';
import 'package:gpapp/app.dart';
import 'package:gpapp/constant/constant.dart';
import 'package:gpapp/pages/login_page.dart';

class AppRoute {
  Route? generateapproute(RouteSettings route) {
    switch (route.name) {
      case loginpage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case stockpage:
        return MaterialPageRoute(builder: (_) => const Stockpage());
      /* case predicionpage:
        return MaterialPageRoute(builder: (_) => const StockPredictionScreen());*/
    }
    return null;
  }
}
