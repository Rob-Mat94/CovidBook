import 'package:flutter/material.dart';
import 'package:my_covid/UI/home.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CovidBook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(title: 'CovidBook'),
    );
  }
}
