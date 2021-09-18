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
      countries.add(CountryModel.fromJson(global[i]));
    }
  }

  static Future<CountryModel> getCountryInfo(String coutryName) async {
    if (coutryName == "United States") {
      coutryName = "USA";
    }
    if (coutryName == "United Kingdom") {
      coutryName = "UK";
    }
    var response = await http.get(
        Uri.parse(
            "https://coronavirus-19-api.herokuapp.com/countries/$coutryName"),
        headers: {'Content-type': 'application/json'});

    var global = jsonDecode(response.body);
    print(global);

    return CountryModel.fromJson(global);
  }
}
