import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "(Day's information is usually available on the evening)",
            style: GoogleFonts.montserrat(
                fontSize: 15,
                color: Colors.lightGreen,
                fontWeight: FontWeight.bold),
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
        onPressed: () {
          globalAlertDialog(context);
        },
        icon: FaIcon(FontAwesomeIcons.infoCircle),
        label: Text(
          "More information",
          style: GoogleFonts.montserrat(),
        ));
  }

  globalAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext c) => AlertDialog(
              insetPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width / 2),
              title: Container(
                  padding: EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.green)),
                  child: Row(
                    children: [
                      Text("Global information"),
                      SizedBox(
                        width: 15,
                      ),
                      FaIcon(FontAwesomeIcons.infoCircle, color: Colors.green)
                    ],
                  )),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          NumberFormat.decimalPattern()
                                  .format(widget._country.cases) +
                              " cases",
                          style: GoogleFonts.montserrat(fontSize: 20)),
                      FaIcon(FontAwesomeIcons.peopleArrows,
                          color: Colors.green, size: 30),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          NumberFormat.decimalPattern()
                                  .format(widget._country.deaths) +
                              " deaths",
                          style: GoogleFonts.montserrat(fontSize: 20)),
                      FaIcon(FontAwesomeIcons.skullCrossbones,
                          color: Colors.green, size: 30),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          NumberFormat.decimalPattern()
                                  .format(widget._country.critical) +
                              " critical",
                          style: GoogleFonts.montserrat(fontSize: 20)),
                      FaIcon(FontAwesomeIcons.procedures,
                          color: Colors.green, size: 30),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          NumberFormat.decimalPattern()
                                  .format(widget._country.recovered) +
                              " recovered",
                          style: GoogleFonts.montserrat(fontSize: 20)),
                      FaIcon(FontAwesomeIcons.plusSquare,
                          color: Colors.green, size: 30),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          NumberFormat.decimalPattern()
                                  .format(widget._country.active) +
                              " active",
                          style: GoogleFonts.montserrat(fontSize: 20)),
                      FaIcon(FontAwesomeIcons.userCheck,
                          color: Colors.green, size: 30),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          NumberFormat.decimalPattern()
                                  .format(widget._country.totalTests) +
                              " tests",
                          style: GoogleFonts.montserrat(fontSize: 20)),
                      FaIcon(FontAwesomeIcons.vial,
                          color: Colors.green, size: 30),
                    ],
                  ),
                ],
              ),
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
