import 'package:flutter/material.dart';
import 'package:my_covid/api/covidAPI.dart';
import 'package:my_covid/app.dart';
import 'package:my_covid/models/country.dart';

List<Country> countries = [];
void main() async {
  await CovidAPI.getAllCountriesInfo();
  runApp(App());
}
