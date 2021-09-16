import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_covid/main.dart';
import 'package:my_covid/models/country.dart';

class CovidAPI {
  static getAllCountriesInfo() async {
    var response = await http.get(
        Uri.parse("https://coronavirus-19-api.herokuapp.com/countries"),
        headers: {'Content-type': 'application/json'});

    var global = jsonDecode(response.body);
    print(global);
    for (int i = 0; i < global.length; i++) {
      countries.add(Country.fromJson(global[i]));
    }
  }

  static Future<Country> getCountryInfo(String coutryName) async {
    var response = await http.get(
        Uri.parse(
            "https://coronavirus-19-api.herokuapp.com/countries/$coutryName"),
        headers: {'Content-type': 'application/json'});

    var global = jsonDecode(response.body);
    print(global);

    return Country.fromJson(global);
  }
}
