import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_covid/api/covidAPI.dart';
import 'package:my_covid/app.dart';
import 'package:my_covid/models/country.dart';
import 'package:connectivity/connectivity.dart';

// AppLocalizations.of(context).settings
List<CountryModel> countries = [];
bool isConnected = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) isConnected = false;
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  await CovidAPI.getAllCountriesInfo();
  runApp(App());
}
