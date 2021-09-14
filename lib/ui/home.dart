import 'package:flutter/material.dart';

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
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Icon(Icons.search),
              SizedBox(
                width: 10,
              )
            ],
          )
        ],
        leading: Icon(Icons.home),
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Center(
              child: Image.asset(
            'assets/terre.jpeg',
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 3,
          )),
        ],
      ),
    );
  }
}
