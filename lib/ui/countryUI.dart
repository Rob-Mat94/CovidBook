import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2),
      ),
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.all(25),
      child: Column(
        children: [
          Text(
            "Today",
            style: GoogleFonts.montserrat(fontSize: 25),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Spacer(),
              Text(widget._country.todayCases.toString() + " case(s)",
                  style: GoogleFonts.montserrat(fontSize: 15)),
              Spacer(),
              FaIcon(FontAwesomeIcons.peopleArrows,
                  color: Colors.green, size: 30),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Spacer(),
              Text(
                widget._country.todayDeaths.toString() + " death(s)",
                style: GoogleFonts.montserrat(fontSize: 15),
              ),
              Spacer(),
              FaIcon(
                FontAwesomeIcons.skullCrossbones,
                color: Colors.green,
                size: 30,
              ),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildGlobalPabel(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            shadowColor: Colors.grey,
            onSurface: Colors.grey,
            enableFeedback: true,
            fixedSize: Size(200, 50)),
        onPressed: () {},
        icon: FaIcon(FontAwesomeIcons.infoCircle),
        label: Text(
          "More Informations",
          style: GoogleFonts.montserrat(),
        ));
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 14,
          ),
          Center(
              child: Card(
            elevation: 5,
            child: Image.network(
                "https://flagcdn.com/w320/" + widget._code + ".png"),
          )),
          SizedBox(
            height: MediaQuery.of(context).size.height / 23,
          ),
          buildTodayPanel(context),
          SizedBox(
            height: MediaQuery.of(context).size.height / 12,
          ),
          buildGlobalPabel(context)
        ],
      ),
    );
  }
}
