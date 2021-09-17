import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_covid/models/country.dart';

class CountryUI extends StatefulWidget {
  late final CountryModel _country;
  late final String _code;
  CountryUI(CountryModel c, String code) {
    this._country = c;
    this._code = code.toLowerCase();
  }
  @override
  State<StatefulWidget> createState() {
    print("Code : " + _code);
    return CountryUIState();
  }
}

class CountryUIState extends State<CountryUI> {
  Widget buildTodayPanel(BuildContext context) {
    return Container();
  }

  Widget buildGlobalPabel(BuildContext context) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: Row(
            children: [
              Spacer(
                flex: 6,
              ),
              Text(widget._country.name),
              Spacer(),
              FaIcon(FontAwesomeIcons.mapMarked),
              Spacer(
                flex: 9,
              ),
            ],
          )),
      body: Column(
        children: [
          Spacer(),
          Center(
              child: Card(
            elevation: 5,
            child: Image.network(
                "https://flagcdn.com/w320/" + widget._code + ".png"),
          )),
          Spacer()
        ],
      ),
    );
  }
}
