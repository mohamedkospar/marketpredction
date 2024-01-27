import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

import 'utils/constants.dart';
import 'utils/providers/provider.dart';
import 'view_models/theme_provider.dart';
import 'views/home.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class Stockpage extends StatelessWidget {
  const Stockpage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<AppProvider>(builder:
          (BuildContext context, AppProvider appProvider, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Constants.appName,
          theme: themeData(
            appProvider.dark ? Constants.darkTheme : Constants.lightTheme,
          ),
          home: const Home(),
        );
      }),
    );
  }
}

// Apply font to our app's theme
ThemeData themeData(ThemeData theme) {
  return theme.copyWith(
    textTheme: GoogleFonts.nunitoTextTheme(
      theme.textTheme,
    ),
  );
}
