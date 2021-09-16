import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_covid/main.dart';
import 'package:country_picker/country_picker.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Spacer(flex: 2),
          Center(
            child: Image.asset(
              "assets/logo_small.png",
              width: MediaQuery.of(context).size.width / 2,
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Container(
            padding: EdgeInsets.only(top: 10, right: 30, left: 30, bottom: 30),
            decoration: BoxDecoration(border: Border.all(color: Colors.green)),
            margin: EdgeInsets.all(10),
            child: Text(
              countries[0].toString(),
              style: GoogleFonts.montserrat(
                fontSize: 20,
                height: 3,
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              showCountryPicker(
                  context: context, onSelect: (Country country) {});
            },
            child: Center(
              child: Image.asset(
                "assets/search.png",
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height / 4,
              ),
            ),
          ),
          Spacer()
        ]));
  }
}
