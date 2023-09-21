//import 'dart:js_interop';

import 'package:flutter/material.dart';

import 'edit.dart';
import 'home.dart';
import 'materials.dart';

void main() {
  const mainColor = Colors.blue;
  const textColor = Colors.white;
  var colorscheme = ColorScheme.fromSeed(seedColor: mainColor);
  runApp(
    MaterialApp(
      title: "Invoice Management",
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const Home(title: 'Blue Ribbon Gutters'),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/prices': (context) => const Placeholder(),
        '/invoice': (context) => const Placeholder(),
        '/materials': (context) => const Materials(),
        '/materials/edit': (context) => const Edit(customdata: ''),
      },
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorscheme,
          primaryColor: mainColor,
          //scaffoldBackgroundColor: mainColor,
          appBarTheme: AppBarTheme(
              elevation: 10,
              titleTextStyle: const TextTheme(
                titleLarge: TextStyle(fontSize: 40, color: textColor),
              ).titleLarge,
              backgroundColor: colorscheme.primary,
              iconTheme: const IconThemeData(color: textColor)),
          textTheme: const TextTheme(
              bodyLarge: TextStyle(
                color: textColor,
                fontSize: 40,
              ),
              displayMedium: TextStyle(
                color: textColor,
                fontSize: 20,
              )),
          iconTheme: const IconThemeData(color: textColor)),
    ),
  );
}
