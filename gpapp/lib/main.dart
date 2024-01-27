import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpapp/app.dart';
import 'package:gpapp/approute.dart';
import 'package:gpapp/auth/authprov.dart';
import 'package:gpapp/pages/alert_page.dart';
import 'package:gpapp/pages/login_page.dart';

import 'package:gpapp/pages/widgets/authprovider.dart';
import 'package:gpapp/widgetss/about.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserProvider>(
        create: (_) => UserProvider(),
      ),
      ChangeNotifierProvider<Auth>(
        create: (_) => Auth(),
      ),
    ],
    child: MyApp(
      appRoute: AppRoute(),
    ),
  ));
}
/*
 1-dart fix --dry-run
 2- dart fix --apply

 */

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRoute});
  final AppRoute appRoute;
  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (context, auth, _) => MaterialApp(
        home: auth.isAuth
            ? const Stockpage()
            : FutureBuilder<bool>(
                future: auth.tryAutoLogin(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.data == true) {
                    return const Stockpage();
                  } else {
                    return const LoginPage();
                  }
                },
              ),
        debugShowCheckedModeBanner: false,
        title: 'TheGorgeousLogin',
        //   onGenerateRoute: appRoute.generateapproute,
        routes: {
          '/stock_page': ((context) => const Stockpage()),
          '/about_page': (context) => const AboutSection(),
          '/alert_page': (context) => AlertWithTwoInputs(),
          '/login_page': (context) => const LoginPage(),
        },
      ),
    );
  }
}
